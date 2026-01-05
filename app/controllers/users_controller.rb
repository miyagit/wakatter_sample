class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:user, :category, :post_likes, :post_comments).order(created_at: :desc)
    @liked_posts = Post.joins(:post_likes).where(post_likes: { user_id: @user.id }).includes(:user, :category, :post_likes, :post_comments).order('post_likes.created_at DESC').distinct
    @commented_posts = Post.joins(:post_comments).where(post_comments: { user_id: @user.id }).includes(:user, :category, :post_likes, :post_comments).order('post_comments.created_at DESC').distinct
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'ユーザーが見つかりませんでした。'
  end
end
