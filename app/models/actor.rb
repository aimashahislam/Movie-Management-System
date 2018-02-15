class Actor < ApplicationRecord
  has_and_belong_to_many :movies
end
