class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @liked_posts = @user.liked_posts.distinct.order('post_likes.created_at DESC')
    @commented_posts = @user.commented_posts.distinct.order('post_comments.created_at DESC')
  end
end
