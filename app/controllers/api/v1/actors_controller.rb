class Api::V1::ActorsController < Api::V1::BaseController

  def index
    actors = Actor.preload(:movies)
    render json: actors, adapter: :json
  end

  def show
    @actor = Actor.find_by_id(params[:id])
    if @actor.present?
      render json: @actor
    else
      render json: { error: 'Record not found.' }, status: 404
    end
  end
end
