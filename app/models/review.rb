class Review < ApplicationRecord
  acts_as_paranoid

  default_scope { order(created_at: :desc) }

  belongs_to :user
  belongs_to :movie
  has_one :report, dependent: :destroy

  validates :rating, :comment, presence: true

  after_save :update_average_rating
  after_destroy :update_average_rating

  protected
    def update_average_rating
      @movie = Movie.find(self.movie_id)
      if @movie.reviews.present?
        @movie.rating = @movie.reviews.average(:rating).round(2)
      else
        @movie.rating = 0
      end
      @movie.save
    end
end
