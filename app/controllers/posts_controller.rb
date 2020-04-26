class PostsController < ApplicationController

  def index
    @posts = Post.all
    @sidebar_posts = Post.joins(:post_likes).group("post_id").order('count_all DESC').count.keys.map{ |post_id| Post.find(post_id) }
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
    authenticate_user!
    redirect_to root_path unless current_user == @post.user
  end

  def update
    authenticate_user!
    @post = Post.find(params[:id])
    redirect_to root_path unless current_user == @post.user
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    authenticate_user!
    redirect_to root_path unless current_user == @post.user
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, :category_id, :image).merge(user_id: current_user.id)
  end
end
