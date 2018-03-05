class HomeController < ApplicationController
  def index
    @movies = Movie.includes(:posters).page(params[:page])
  end
end
