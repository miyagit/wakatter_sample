class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, ImageUploader

  has_many :posts
  has_many :post_likes
  has_many :post_comments
  
  # ダイレクトメッセージの関連付け
  has_many :sent_messages, class_name: 'DirectMessage', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'DirectMessage', foreign_key: 'receiver_id'

  validates :username, presence: true
end
