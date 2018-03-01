class HomeController < ApplicationController
  def index
    @movies = Movie.page(params[:page]).per(10).includes(:posters)
  end
end
