class MoviesController < ApplicationController

  def index
    @movies = Movie.includes(:posters)
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
