class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, ImageUploader

  has_many :posts
  has_many :post_likes
  has_many :liked_posts, through: :post_likes, source: :post
  has_many :post_comments
  has_many :commented_posts, through: :post_comments, source: :post

  # Follow associations
  has_many :active_follows, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_follows, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy
  has_many :following, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows, source: :follower

  validates :username, presence: true

  # Follow helper methods
  def follow(user)
    following << user unless following.include?(user)
  end

  def unfollow(user)
    following.delete(user)
  end

  def following?(user)
    following.include?(user)
  end
end
