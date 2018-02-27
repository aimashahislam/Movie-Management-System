class UsersController < ApplicationController
  before_action :set_user, only: [:show, :addFavourites]

  def show
    @movies = @user.favourite_movies
  end

  def addFavourites
    @favourite = @user.favourites.build
    @favourite.movie_id = params[:movie_id]
    @favourite.user_id = current_user.id
    @favourite.save
    redirect_to root_path
  end

private
  def set_user
    @user = User.find(current_user.id)
  end
end
