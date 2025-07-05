class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  
  has_many :group_members, dependent: :destroy
  has_many :users, through: :group_members
  has_many :group_posts, dependent: :destroy
  has_many :posts, through: :group_posts
  
  validates :name, presence: true, uniqueness: true
  validates :creator_id, presence: true
  
  scope :public_groups, -> { all } # For future privacy settings
end
