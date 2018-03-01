class Admin::HomeController < Admin::BaseController
  def index
    @movies = Movie.page(params[:page]).per(10).includes(:posters)
  end
end
