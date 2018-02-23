class Admin::AdminsController < Admin::BaseController
  def index
    @movies = Movie.includes(:posters)
  end
end
