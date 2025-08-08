require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "should show user" do
    get user_path(@user)
    assert_response :success
    assert_select 'h1', @user.username
  end

  test "should display user posts" do
    get user_path(@user)
    assert_response :success
    assert_select '#posts'
  end

  test "should display user likes" do
    get user_path(@user)
    assert_response :success
    assert_select '#likes'
  end

  test "should display user comments" do
    get user_path(@user)
    assert_response :success
    assert_select '#comments'
  end
end