class Movie < ApplicationRecord
  scope :ordered, -> { order('created_at desc') }

  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :actors
  has_many :posters, dependent: :destroy


  validates :name, :genre, :duration, :description, :release_date, presence: true
  validates :name, length: { minimum: 2 }

  accepts_nested_attributes_for :posters, allow_destroy: true

end
