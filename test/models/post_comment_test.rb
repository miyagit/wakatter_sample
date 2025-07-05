require 'test_helper'

class PostCommentTest < ActiveSupport::TestCase
  def setup
    @user1 = users(:one)
    @user2 = users(:two)
    @post = posts(:one)
  end

  test "should create notification when different user comments on post" do
    assert_difference 'Notification.count', 1 do
      PostComment.create!(user: @user2, post: @post, body: "Great post!")
    end
    
    notification = Notification.last
    assert_equal @post.user, notification.recipient
    assert_equal @user2, notification.actor
    assert_equal 'PostComment', notification.notifiable_type
  end

  test "should not create notification when user comments on own post" do
    assert_no_difference 'Notification.count' do
      PostComment.create!(user: @post.user, post: @post, body: "My own comment")
    end
  end
end
