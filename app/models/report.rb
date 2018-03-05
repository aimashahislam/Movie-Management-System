class Report < ApplicationRecord
  acts_as_paranoid

  belongs_to :review

  after_save :set_reported
  after_destroy :reset_reported

  paginates_per 8

  protected
    def set_reported
      @review = Review.find(self.review_id)
      @review.reported = true
      @review.save
    end

    def reset_reported
      @review = Review.find(self.review_id)
      @review.reported = false
      @review.save
    end
end
