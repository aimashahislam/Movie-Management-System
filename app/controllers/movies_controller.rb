class MoviesController < ApplicationController

  def index
    @movies = Movie.search(params[:search],sql: {include: :posters})
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
