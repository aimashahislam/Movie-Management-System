class Api::V1::MoviesController < Api::V1::BaseController

  def index
    movies = Movie.preload(:actors, :posters, :reviews)
    render json: movies, adapter: :json
  end

  def show
    @movie = Movie.find_by_id(params[:id])
    if @movie.present?
      render json: @movie
    else
      render json: { error: 'Record not found.' }, status: 404
    end
  end
end
