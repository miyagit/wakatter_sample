class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  
  # Group associations
  has_many :group_posts, dependent: :destroy
  has_many :groups, through: :group_posts

  mount_uploader :image, ImageUploader

  validates :title, :url, :description, presence: true

  def liked_by?(user)
    post_likes.exists?(user_id: user.id)
  end
  
  def in_group?
    group_posts.exists?
  end
end
