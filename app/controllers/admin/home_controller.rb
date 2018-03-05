class Admin::HomeController < Admin::BaseController
  def index
    @movies = Movie.page(params[:page]).per(20).includes(:posters)
  end
end
