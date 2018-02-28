class ActorsController < ApplicationController

  def index
    @actors = Actor.search(params[:search], with: {deleted_at: 0})
  end

  def show
    @actor = Actor.find(params[:id])
  end

end
