class MoviesController < ApplicationController

  def index
    @movies = Movie.search(params[:search], with: {deleted_at: 0}, sql: {include: :posters})
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
