class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    
    # Get user's posts
    @user_posts = @user.posts.order(created_at: :desc)
    
    # Get posts the user has liked
    @liked_posts = Post.joins(:post_likes)
                      .where(post_likes: { user_id: @user.id })
                      .order('post_likes.created_at DESC')
    
    # Get posts the user has commented on (distinct to avoid duplicates)
    @commented_posts = Post.joins(:post_comments)
                          .where(post_comments: { user_id: @user.id })
                          .distinct
                          .order('post_comments.created_at DESC')
  end
end