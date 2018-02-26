class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

  before_action :set_review, only: [:edit, :update, :show, :destroy]
  before_action :set_movie, only: [:create, :new, :edit, :update, :destroy]

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = @movie.reviews.create(review_params)
    @review.user_id = current_user.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to movie_path(@movie), notice: 'Review was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to movie_path(@movie), notice: 'Review was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to movie_path(@movie), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_movie
      if params[:movie_id].present?
        @movie = Movie.find(params[:movie_id])
      else
        @movie = Movie.find(@review.movie_id)
      end
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
