class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    
    # Get user's posts with necessary associations to avoid N+1 queries
    @user_posts = @user.posts.includes(:user, :category, :post_likes, :post_comments)
                      .order(created_at: :desc)
    
    # Get posts the user has liked with necessary associations
    @liked_posts = Post.joins(:post_likes)
                      .includes(:user, :category, :post_likes, :post_comments)
                      .where(post_likes: { user_id: @user.id })
                      .order('post_likes.created_at DESC')
    
    # Get posts the user has commented on with necessary associations (distinct to avoid duplicates)
    @commented_posts = Post.joins(:post_comments)
                          .includes(:user, :category, :post_likes, :post_comments)
                          .where(post_comments: { user_id: @user.id })
                          .distinct
                          .order('post_comments.created_at DESC')
  end
end