module ReviewsHelper
  def edit_link_for_review(review)
    if user_signed_in? && review.user_id == current_user.id
      link_to 'Edit', edit_movie_review_path(@movie, review)
    end
  end

  def delete_link_for_review(review)
    if user_signed_in? && review.user_id == current_user.id || current_user.try(:admin)
      link_to 'Delete', movie_review_path(@movie, review), method: :delete, data: {confirm: "Are you sure?"}
    end
  end

  def report_link_for_review(review)
    if user_signed_in? && review.reported == false
      link_to 'Report', new_review_report_path(review)
    end
  end
end
