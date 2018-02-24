class Review < ApplicationRecord
  scope :ordered, -> { order('created_at desc') }

  validates :rating, :comment, presence: true

  belongs_to :user
  belongs_to :movie

end
