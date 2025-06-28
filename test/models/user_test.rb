require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "liked_posts returns posts user has liked" do
    user = User.create!(username: "testuser", email: "test@example.com", password: "password")
    other_user = User.create!(username: "otheruser", email: "other@example.com", password: "password")
    
    # Create posts and categories
    category = Category.create!(name: "Test Category")
    post1 = Post.create!(title: "Post 1", url: "http://example.com/1", description: "Test", user: other_user, category: category)
    post2 = Post.create!(title: "Post 2", url: "http://example.com/2", description: "Test", user: other_user, category: category)
    
    # User likes post1
    PostLike.create!(user: user, post: post1)
    
    liked_posts = user.liked_posts
    assert_includes liked_posts, post1
    assert_not_includes liked_posts, post2
  end

  test "commented_posts returns posts user has commented on" do
    user = User.create!(username: "testuser", email: "test@example.com", password: "password")
    other_user = User.create!(username: "otheruser", email: "other@example.com", password: "password")
    
    # Create posts and categories
    category = Category.create!(name: "Test Category")
    post1 = Post.create!(title: "Post 1", url: "http://example.com/1", description: "Test", user: other_user, category: category)
    post2 = Post.create!(title: "Post 2", url: "http://example.com/2", description: "Test", user: other_user, category: category)
    
    # User comments on post1
    PostComment.create!(user: user, post: post1, body: "Test comment")
    
    commented_posts = user.commented_posts
    assert_includes commented_posts, post1
    assert_not_includes commented_posts, post2
  end
end
