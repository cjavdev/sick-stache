class ShowsController < ApplicationController
  def index
    @shows = Show.all
    render json: @shows
  end

  def show
    @show = Show.find(params[:id])
    render json: @show
  end
  
  def titles
    @titles = Show.names_like(params[:q])
    render json: @titles
  end

  def create
    @show = Show.new_with_name(params[:value]) 
    if @show.save
      redirect_to @show
    else
      flash[:errors] = @show.errors.full_messages
      render :new
    end
  end
end
