class Actor < ApplicationRecord
  acts_as_paranoid

  default_scope { order(created_at: :desc) }

  has_and_belongs_to_many :movies

  validates :name, length: { in: 2..255 }
  validates :bio, :name, :date_of_birth, presence: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  paginates_per 8
end
