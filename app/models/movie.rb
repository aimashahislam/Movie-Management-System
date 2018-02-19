class Movie < ApplicationRecord
  
  validates :name, :genre, :duration, :description, :release_date, presence: true
  
  has_and_belongs_to_many :actors
  has_many :posters, dependent: :destroy
  
  accepts_nested_attributes_for :posters, allow_destroy: true
  validates_associated :posters
  
end
