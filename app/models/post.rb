class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy

  mount_uploader :image, ImageUploader

  def liked_by?(user)
    post_likes.exists?(user_id: user.id)
  end
end
