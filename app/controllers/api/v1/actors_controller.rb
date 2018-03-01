class Api::V1::ActorsController < Api::V1::BaseController

  def index
    actors = Actor.preload(:movies)
    render json: actors, adapter: :json
  end

  def show
    @actor = Actor.find(params[:id])
    render json: @actor, adapter: :json
  end
end
