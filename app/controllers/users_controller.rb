class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @liked_posts = @user.liked_posts.distinct.joins(:post_likes).merge(PostLike.order(created_at: :desc))
    @commented_posts = @user.commented_posts.distinct.joins(:post_comments).merge(PostComment.order(created_at: :desc))
  end
end
