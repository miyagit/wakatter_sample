require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should show user detail page" do
    user = users(:test_user)
    
    get user_path(user)
    assert_response :success
    assert_select 'h2', text: "#{user.username}さんの詳細ページ"
  end

  test "should display user posts, likes, and comments sections" do
    user = users(:test_user)
    
    get user_path(user)
    assert_response :success
    
    # Check for the three main sections
    assert_select 'a', text: '投稿一覧'
    assert_select 'a', text: 'いいね一覧'
    assert_select 'a', text: 'コメント一覧'
  end

  test "should show different content for different tabs" do
    user = users(:test_user)
    
    # Test default tab (posts)
    get user_path(user)
    assert_response :success
    assert_select 'h3', text: /投稿一覧/
    
    # Test likes tab
    get user_path(user, tab: 'likes')
    assert_response :success
    assert_select 'h3', text: /いいね一覧/
    
    # Test comments tab
    get user_path(user, tab: 'comments')
    assert_response :success
    assert_select 'h3', text: /コメント一覧/
  end
end