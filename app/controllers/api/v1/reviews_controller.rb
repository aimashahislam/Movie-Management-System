class Api::V1::ReviewsController < Api::V1::BaseController

  def index
    reviews = Review.preload(:movie, :user, :report)
    render json: reviews, adapter: :json
  end

  def show
    @review = Review.find_by_id(params[:id])
    if @review.present?
      render json: @review
    else
      render json: { error: 'Record not found.' }, status: 404
    end
  end
end
