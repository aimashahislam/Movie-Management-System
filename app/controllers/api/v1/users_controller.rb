class Api::V1::UsersController < Api::V1::BaseController

  def index
    users = User.preload(:reviews, :favourite_movies)
    render json: users, adapter: :json
  end

  def show
    @user = User.find_by_id(params[:id])
    if @user.present?
      render json: @user
    else
      render json: { error: 'Record not found.' }, status: 404
    end
  end
end
