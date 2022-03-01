class SitesController < ApplicationController
  before_action :set_portfolio_sites, only: :index
  before_action :set_site, only: %i[show insight]
  before_action :authorize_user, except: :index

  def index
    authorize @portfolio

    render json: @sites, status: :ok
  end

  def show
    render json: @site, status: :ok
  end

  def insight
    render json: @site.insight, status: :ok
  end

  private

  def set_site
    @site = Site.find_by(id: params[:id])

    render json: { error: 'Invalid Site id!' }, status: :not_found unless @site
  end

  def set_portfolio_sites
    @portfolio = Portfolio.find_by(id: params[:portfolio_id])
    @sites = @portfolio&.sites

    render json: { error: 'Invalid Portfolio id!' }, status: :not_found unless @sites
  end

  def authorize_user
    authorize @site
  end
end
