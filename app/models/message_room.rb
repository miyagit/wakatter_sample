class MessageRoom < ApplicationRecord
  has_many :message_room_users, dependent: :destroy
  has_many :users, through: :message_room_users
  has_many :messages, dependent: :destroy

  def last_message
    messages.order(created_at: :desc).first
  end

  def other_user(current_user)
    users.where.not(id: current_user.id).first
  end
end
