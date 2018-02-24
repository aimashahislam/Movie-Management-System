class Admin::HomeController < Admin::BaseController
  def index
    @movies = Movie.includes(:posters)
  end
end
