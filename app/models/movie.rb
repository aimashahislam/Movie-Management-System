class Movie < ApplicationRecord
  acts_as_paranoid

  default_scope { order(created_at: :desc) }

  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :actors
  has_many :posters, dependent: :destroy


  validates :name, :genre, :duration, :description, :release_date, presence: true
  validates :name, length: { in: 2..255 }

  accepts_nested_attributes_for :posters, allow_destroy: true
end
