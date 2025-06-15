require 'test_helper'

class PostLikeTest < ActiveSupport::TestCase
  def setup
    @user1 = users(:one)
    @user2 = users(:two)
    @post = posts(:one)
  end

  test "should create notification when different user likes post" do
    assert_difference 'Notification.count', 1 do
      PostLike.create!(user: @user2, post: @post)
    end
    
    notification = Notification.last
    assert_equal @post.user, notification.recipient
    assert_equal @user2, notification.actor
    assert_equal 'PostLike', notification.notifiable_type
  end

  test "should not create notification when user likes own post" do
    assert_no_difference 'Notification.count' do
      PostLike.create!(user: @post.user, post: @post)
    end
  end
end
