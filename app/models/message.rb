class Message < ApplicationRecord
  belongs_to :user
  belongs_to :message_room

  validates :content, presence: true

  default_scope -> { order(created_at: :asc) }

  def message_time
    created_at.strftime("%H:%M")
  end
  
  def message_date
    created_at.strftime("%Y年%m月%d日")
  end
end
