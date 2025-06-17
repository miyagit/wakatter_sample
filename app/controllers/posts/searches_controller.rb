class Posts::SearchesController < ApplicationController
  def index
    @posts = if params[:q].present?
               Post.search(params[:q]).order(created_at: :desc)
             else
               Post.order(created_at: :desc)
             end
    @sidebar_posts = Post.order(likes_count: :DESC)
    render 'posts/index'
  end
end