class PostsController < ApplicationController

  def index
    if user_signed_in? && current_user.following.any?
      # Show posts from followed users and current user's own posts
      followed_user_ids = current_user.following.pluck(:id)
      followed_user_ids << current_user.id  # Include user's own posts
      @posts = Post.where(user_id: followed_user_ids).order(created_at: :DESC)
    else
      # Show all posts if not logged in or not following anyone
      @posts = Post.order(created_at: :DESC)
    end
    @sidebar_posts = Post.order(likes_count: :DESC)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, flash: {notice: "投稿が完了しました。"}
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authenticate_user!
    redirect_to root_path, flash: {alert: "投稿者でなければ、編集できません。"} unless current_user == @post.user
  end

  def update
    authenticate_user!
    @post = Post.find(params[:id])
    redirect_to root_path unless current_user == @post.user
    if @post.update(post_params)
      redirect_to posts_path, flash: {notice: "更新が完了しました。"}
    else
      render :edit
    end
  end

  def destroy
    authenticate_user!
    redirect_to root_path, flash: {alert: "投稿者でなければ、削除できません。"} unless current_user == @post.user
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, flash: {notice: "削除が完了しました。"}
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, :category_id, :image).merge(user_id: current_user.id)
  end
end
