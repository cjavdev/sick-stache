class EpisodesController < ApplicationController
  respond_to :json

  def index
    @episodes = Episode.all
    respond_with(@episodes)
  end

  def show
    @episode = Episode.find(params[:id])
    respond_with(@episode)
  end
end
