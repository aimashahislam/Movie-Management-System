class Report < ApplicationRecord
  acts_as_paranoid

  belongs_to :review
end
