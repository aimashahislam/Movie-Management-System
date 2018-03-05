class HomeController < ApplicationController
  def index
    @movies = Movie.page(params[:page]).per(8).includes(:posters)
  end
end
