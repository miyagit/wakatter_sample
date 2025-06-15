class Notification < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read: false) }
  scope :recent, -> { order(created_at: :desc) }

  def mark_as_read!
    update!(read: true)
  end

  def message
    case notifiable_type
    when 'PostLike'
      "#{actor.username}さんがあなたの投稿に「わかった！」をつけました"
    when 'PostComment'
      "#{actor.username}さんがあなたの投稿にコメントしました"
    else
      "新しい通知があります"
    end
  end

  def post
    case notifiable_type
    when 'PostLike'
      notifiable.post
    when 'PostComment'
      notifiable.post
    end
  end
end