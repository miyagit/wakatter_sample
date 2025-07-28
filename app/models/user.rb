class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, ImageUploader

  has_many :posts
  has_many :post_likes
  has_many :post_comments

  # Follow associations
  has_many :active_follows, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_follows, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy
  has_many :following, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows, source: :follower

  # Group associations
  has_many :created_groups, class_name: 'Group', foreign_key: 'creator_id', dependent: :destroy
  has_many :group_members, dependent: :destroy
  has_many :groups, through: :group_members

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
  
  # Group helper methods
  def member_of?(group)
    group_members.accepted.exists?(group: group)
  end
  
  def admin_of?(group)
    group_members.accepted.admins.exists?(group: group) || created_groups.include?(group)
  end
  
  def pending_member_of?(group)
    group_members.pending.exists?(group: group)
  end
end
