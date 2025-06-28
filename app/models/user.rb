class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, ImageUploader

  has_many :posts
  has_many :post_likes
  has_many :post_comments

  validates :username, presence: true

  # Get posts that the user has liked
  def liked_posts
    Post.joins(:post_likes).where(post_likes: { user_id: id })
  end

  # Get posts that the user has commented on
  def commented_posts
    Post.joins(:post_comments).where(post_comments: { user_id: id }).distinct
  end
end
