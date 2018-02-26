module ReviewsHelper
  def set_edit_link_for_review(review)
    if user_signed_in? && review.user_id == current_user.id
      link_to 'Edit', edit_movie_review_path(@movie, review)
    end
  end

  def set_delete_link_for_review(review)
    if user_signed_in? && review.user_id == current_user.id || current_user.try(:admin)
      link_to 'Delete', movie_review_path(@movie, review), method: :delete, data: {confirm: "Are you sure?"}
    end
  end

  def set_report_link_for_review(review)
    if user_signed_in?
      link_to 'Report', new_review_report_path(review)
    end
  end
end
