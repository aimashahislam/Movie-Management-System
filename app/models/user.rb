class User < ApplicationRecord
  scope :ordered, -> { order('created_at desc') }

  has_many :reviews, dependent: :destroy

  validates :email, format: Devise.email_regexp
  validates :name, presence: true, length: { minimum: 2 }
  validates :phone_no, presence: true, numericality: { only_integer: true }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
