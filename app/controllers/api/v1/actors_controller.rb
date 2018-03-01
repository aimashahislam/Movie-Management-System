class Api::V1::ActorsController < Api::V1::BaseController

  def index
    actors = Actor.preload(:movies)
    render json: actors
  end

  def show
    @actor = Actor.find(params[:id])
    render json: @actor

    rescue
      render json: { error: 'Record not found.' }, status: 404
  end
end
