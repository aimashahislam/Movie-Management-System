class Api::V1::MoviesController < Api::V1::BaseController

  def index
    movies = Movie.preload(:actors, :posters, :reviews)
    render json: movies
  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie

    rescue
      render json: { error: 'Record not found.' }, status: 404
  end
end
