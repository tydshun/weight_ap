class User < ApplicationRecord
  validates :nickname, presence: true
  validates :profile, length: { maximum: 200 }
  has_many :tweets, dependent: :destroy
  has_many :comments , dependent: :destroy
  has_many :blogs
  has_many :weights
  has_one_attached :image


  has_one_attached :avatar


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
