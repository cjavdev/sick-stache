class EpisodesController < ApplicationController
  def index
    Episode.refresh
    @episodes = Episode.order('first_aired DESC')
    render json: @episodes
  end

  def show
    @episode = Episode.find(params[:id])
    render json: @episode
  end

  def update
    @episode = Episode.find(params[:id])
    if @episode.update_attributes(params[:episode])
      render json: @episode
    else
      render json: @episode.errors.full_messages, status: 422
    end 
  end
end
