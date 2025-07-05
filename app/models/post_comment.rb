class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true

  after_create :create_notification

  private

  def create_notification
    # Don't notify if user comments on their own post
    return if user_id == post.user_id

    Notification.create!(
      recipient: post.user,
      actor: user,
      notifiable: self
    )
  end
end
