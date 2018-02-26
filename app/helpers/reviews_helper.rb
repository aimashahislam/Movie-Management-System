module ReviewsHelper
  def setEditLinkForReview(review)
    if user_signed_in? && review.user_id == current_user.id
      link_to 'Edit', edit_movie_review_path(@movie, review)
    end
  end

  def setDeleteLinkForReview(review)
    if user_signed_in? && review.user_id == current_user.id || current_user.try(:admin)
      link_to 'Delete', movie_review_path(@movie, review), method: :delete, data: {confirm: "Are you sure?"}
    end
  end
end
