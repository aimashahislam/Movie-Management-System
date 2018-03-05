module ReviewsHelper
  def edit_link_for_review(review)
    if user_signed_in? && review.user_id == current_user.id
      edit_movie_review_path(@movie, review)
    end
  end

  def delete_link_for_review(review)
    if user_signed_in? && review.user_id == current_user.id || current_user.try(:admin)
      movie_review_path(@movie, review)
    end
  end

  def report_link_for_review(review)
    if user_signed_in? && review.user_id != current_user.id && review.reported == false
      new_review_report_path(review)
    end
  end
end
