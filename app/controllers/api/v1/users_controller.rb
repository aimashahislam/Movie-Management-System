class Api::V1::UsersController < Api::V1::BaseController

  def index
    users = User.preload(:reviews, :favourite_movies)
    render json: users, adapter: :json
  end

  def show
    @user = User.find(params[:id])
    render json: @user, adapter: :json
  end
end
