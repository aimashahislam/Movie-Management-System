class Api::V1::MoviesController < Api::V1::BaseController

  def index
    movies = Movie.preload(:actors, :posters, :reviews)
    render json: movies, adapter: :json
  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie, adapter: :json
  end
end
