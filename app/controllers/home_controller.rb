class HomeController < ApplicationController
  def index
    @movies = Movie.includes(:posters)
  end
end
