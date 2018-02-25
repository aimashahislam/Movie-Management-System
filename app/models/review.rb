class Review < ApplicationRecord
  default_scope { order(created_at: :desc) }

  validates :rating, :comment, presence: true

  belongs_to :user
  belongs_to :movie

  after_save :update_average_rating
  after_destroy :update_average_rating

  protected
    def update_average_rating
      @movie = Movie.find(self.movie_id)
      @movie.rating = @movie.reviews.average(:rating).round(2)
      @movie.save
    end
end
