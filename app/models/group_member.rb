class GroupMember < ApplicationRecord
  belongs_to :group
  belongs_to :user
  
  validates :role, presence: true, inclusion: { in: %w[admin member] }
  validates :status, presence: true, inclusion: { in: %w[pending accepted rejected] }
  validates :user_id, uniqueness: { scope: :group_id }
  
  scope :accepted, -> { where(status: 'accepted') }
  scope :pending, -> { where(status: 'pending') }
  scope :admins, -> { where(role: 'admin') }
  scope :members, -> { where(role: 'member') }
end
