require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  def setup
    @user1 = users(:one)
    @user2 = users(:two)
    @post = posts(:one)
    @post_like = PostLike.create!(user: @user2, post: @post)
  end

  test "should be valid with valid attributes" do
    notification = Notification.new(
      recipient: @user1,
      actor: @user2,
      notifiable: @post_like
    )
    assert notification.valid?
  end

  test "should require recipient" do
    notification = Notification.new(
      actor: @user2,
      notifiable: @post_like
    )
    assert_not notification.valid?
  end

  test "should require actor" do
    notification = Notification.new(
      recipient: @user1,
      notifiable: @post_like
    )
    assert_not notification.valid?
  end

  test "should require notifiable" do
    notification = Notification.new(
      recipient: @user1,
      actor: @user2
    )
    assert_not notification.valid?
  end

  test "should mark as read" do
    notification = Notification.create!(
      recipient: @user1,
      actor: @user2,
      notifiable: @post_like
    )
    assert_not notification.read?
    notification.mark_as_read!
    assert notification.read?
  end

  test "should return correct message for like notification" do
    notification = Notification.create!(
      recipient: @user1,
      actor: @user2,
      notifiable: @post_like
    )
    expected_message = "#{@user2.username}さんがあなたの投稿に「わかった！」をつけました"
    assert_equal expected_message, notification.message
  end
end