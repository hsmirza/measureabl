class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[show insight]
  before_action :authorize_user, only: %i[show insight]

  def index
    portfolios = Portfolio.all
    render json: portfolios, status: :ok
  end

  def show
    render json: @portfolio, status: :ok
  end

  def insight
    render json: @portfolio.insight, status: :ok
  end

  private

  def authorize_user
    authorize @portfolio
  end

  def set_portfolio
    @portfolio = Portfolio.find_by(id: params[:id])

    render json: { error: 'Ivalid Portfolio id!' }, status: :not_found unless @portfolio
  end
end
