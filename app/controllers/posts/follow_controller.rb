class Posts::FollowController < PostsController

  def index
    if user_signed_in? && current_user.following.any?
      # Show posts from followed users and current user's own posts
      followed_user_ids = current_user.following.pluck(:id)
      followed_user_ids << current_user.id  # Include user's own posts
      @posts = Post.where(user_id: followed_user_ids).order(created_at: :DESC)
    else
      # Show empty if not logged in or not following anyone
      @posts = Post.none
    end
    @sidebar_posts = Post.order(likes_count: :DESC)
  end
end