class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, ImageUploader

  has_many :posts
  has_many :post_likes
  has_many :post_comments
  has_many :notifications, foreign_key: 'recipient_id', dependent: :destroy

  validates :username, presence: true
end
