class Users::MypagesController < ApplicationController
  before_action :authenticate_user!

  def show; end

  def liked_posts
    @posts = Post.joins(:post_likes)
                 .where(post_likes: { user_id: current_user.id })
                 .order('post_likes.created_at DESC')
    @sidebar_posts = Post.order(likes_count: :DESC)
  end

  def commented_posts
    @posts = Post.joins(:post_comments)
                 .where(post_comments: { user_id: current_user.id })
                 .order('post_comments.created_at DESC')
                 .distinct
    @sidebar_posts = Post.order(likes_count: :DESC)
  end
end
