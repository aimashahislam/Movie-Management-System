class Admin::AdminsController < ApplicationController
  def index
    @movies = Movie.includes(:posters)
  end
end
