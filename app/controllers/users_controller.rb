class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :DESC)
    @liked_posts = Post.joins(:post_likes).where(post_likes: { user_id: @user.id }).order('post_likes.created_at DESC')
    @commented_posts = Post.joins(:post_comments).where(post_comments: { user_id: @user.id }).order('post_comments.created_at DESC').distinct
  end
end
