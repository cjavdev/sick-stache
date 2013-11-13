class EpisodesController < ApplicationController
  def index
    @episodes = Episode.includes(:show).order('first_aired DESC').page(params[:page])
    render handlers: [:rabl]
  end

  def show
    @episode = Episode.includes(:show).find(params[:id])
    render handlers: [:rabl] 
  end

  def update
    @episode = Episode.find(params[:id])
    if @episode.update_attributes(params[:episode])
      render "show.rabl" 
    else
      render json: @episode.errors.full_messages, status: 422
    end 
  end

  def refresh
    Episode.refresh
    head :ok    
  end
end
