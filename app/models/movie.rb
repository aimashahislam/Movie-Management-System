class Movie < ApplicationRecord
  attr_accessible :name
  has_and_belongs_to_many :actors
  has_many :posters, dependent: :destroy
  accepts_nested_attributes_for :posters, allow_destroy: true
end
