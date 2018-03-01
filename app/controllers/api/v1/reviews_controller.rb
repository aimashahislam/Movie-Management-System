class Api::V1::ReviewsController < Api::V1::BaseController

  def index
    reviews = Review.preload(:movie, :user, :report)
    render json: reviews
  end

  def show
    @review = Review.find(params[:id])
    render json: @review
    rescue
      render json: { error: 'Record not found.' }, status: 404
  end
end
