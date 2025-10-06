class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, :url, :description, presence: true

  def self.search(query)
    return all if query.blank?
    
    joins(:user, :category)
      .where(
        'posts.title LIKE ? OR posts.url LIKE ? OR users.username LIKE ? OR categories.name LIKE ?',
        "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"
      )
  end

  def liked_by?(user)
    post_likes.exists?(user_id: user.id)
  end
end
