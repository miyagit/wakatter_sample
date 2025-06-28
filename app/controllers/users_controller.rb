class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.order(created_at: :DESC)
    @liked_posts = @user.liked_posts.order(created_at: :DESC)
    @commented_posts = @user.commented_posts.order(created_at: :DESC)
  end
end