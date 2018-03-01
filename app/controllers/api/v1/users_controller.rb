class Api::V1::UsersController < Api::V1::BaseController

  def index
    users = User.preload(:reviews, :favourite_movies)
    render json: users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
    rescue
      render json: { error: 'Record not found.' }, status: 404
  end
end
