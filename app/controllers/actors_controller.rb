class ActorsController < ApplicationController

  def index
    @actors = Actor.search(params[:search], with: {deleted_at: 0}, page: params[:page], per_page: 10)
  end

  def show
    @actor = Actor.find(params[:id])
  end

end
