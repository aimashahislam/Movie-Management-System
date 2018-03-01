class Api::V1::ReviewsController < Api::V1::BaseController

  def index
    reviews = Review.preload(:movie, :user, :report)
    render json: reviews, adapter: :json
  end

  def show
    @review = Review.find(params[:id])
    render json: @review, adapter: :json
  end
end
