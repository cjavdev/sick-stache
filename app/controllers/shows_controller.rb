class ShowsController < ApplicationController
  respond_to :json

  def index
    @shows = Show.all
    respond_with(@shows)
  end

  def show
    @show = Show.find(params[:id])
    respond_with(@show)
  end
end
