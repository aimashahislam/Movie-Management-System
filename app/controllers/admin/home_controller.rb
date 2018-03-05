class Admin::HomeController < Admin::BaseController
  def index
    @movies = Movie.includes(:posters).page(params[:page])
  end
end
