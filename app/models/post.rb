class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, :url, :description, presence: true

  # Search scopes
  scope :by_title, ->(title) { title.present? ? where('title LIKE ?', "%#{title}%") : all }
  scope :by_url, ->(url) { url.present? ? where('url LIKE ?', "%#{url}%") : all }
  scope :by_username, ->(username) { username.present? ? joins(:user).where(users: { username: username }) : all }
  scope :by_category, ->(category_name) { category_name.present? ? joins(:category).where(categories: { name: category_name }) : all }

  def self.search(params = {})
    posts = all
    
    # Handle general search (q parameter) - search across title and url
    if params[:q].present?
      posts = posts.where('title LIKE ? OR url LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
    end
    
    # Handle specific field searches
    posts = posts.by_title(params[:title])
    posts = posts.by_url(params[:url]) 
    posts = posts.by_username(params[:username])
    posts = posts.by_category(params[:category])
    
    posts
  end

  def liked_by?(user)
    post_likes.exists?(user_id: user.id)
  end
end
