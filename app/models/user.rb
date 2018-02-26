class User < ApplicationRecord
  acts_as_paranoid

  default_scope { order(created_at: :desc) }

  has_many :reviews, dependent: :destroy
  has_many :favourites
  has_many :favourite_movies, through: :favourites, source: :movies
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates :email, format: Devise.email_regexp
  validates :name, presence: true
  validates :name, length: { in: 2..255 }
  validates :phone_no, numericality: { only_integer: true }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
