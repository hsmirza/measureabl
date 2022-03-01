class SpacesController < ApplicationController
  before_action :set_site, only: :index
  before_action :set_space, only: :show

  def index
    authorize @site
    render json: @site.spaces, status: :ok
  end

  def show
    authorize @space
    render json: @space, status: :ok
  end

  private

  def set_space
    @space = Space.find_by(id: params[:id])

    render json: { error: 'Ivalid Space id!' }, status: :not_found unless @space
  end

  def set_site
    @site = Site.find_by(id: params[:site_id])

    render json: { error: 'Invalid Site id!' }, status: :not_found unless @site
  end
end
