class UsersController < ApplicationController
  before_action :set_user, only: [:show, :add_favourites, :remove_favourites]
  before_action :set_movie, only: [:add_favourites, :remove_favourites]

  def show
    @movies = @user.favourite_movies
  end

  def add_favourites
    @favourite = @user.favourites.build
    @favourite.movie_id = params[:movie_id]
    @favourite.user_id = current_user.id
    @favourite.save
    redirect_to movie_path(@movie)
  end

  def remove_favourites
    @favourite = @user.favourites.where(movie_id: params[:movie_id]).where(user_id: current_user.id)
    @user.favourites.destroy(@favourite)
    redirect_to movie_path(@movie)
  end

private
  def set_user
    @user = User.find(current_user.id)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
