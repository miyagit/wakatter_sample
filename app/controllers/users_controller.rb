class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    
    # ユーザーが投稿した記事一覧
    @user_posts = @user.posts.order(created_at: :desc)
    
    # ユーザーがいいねした記事一覧
    @liked_posts = Post.joins(:post_likes)
                      .where(post_likes: { user_id: @user.id })
                      .order(created_at: :desc)
    
    # ユーザーがコメントした記事一覧
    @commented_posts = Post.joins(:post_comments)
                          .where(post_comments: { user_id: @user.id })
                          .order(created_at: :desc)
                          .distinct
  end
end