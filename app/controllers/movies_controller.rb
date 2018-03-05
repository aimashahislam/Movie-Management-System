class MoviesController < ApplicationController

  def index
    #@movies = Movie.search(params[:search], with: {deleted_at: 0}, sql: {include: :posters}, page: params[:page], per_page: 10)
    @movies = Movie.page(params[:page]).per(8).includes(:posters)
  end

  def show
    @movie = Movie.find(params[:id])
    if user_signed_in?
      @review = Review.where(user_id: current_user.id, movie_id: @movie.id)
    end
  end
end
