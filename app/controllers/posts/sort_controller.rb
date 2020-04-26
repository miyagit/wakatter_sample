class Posts::SortController < PostsController

  def index
    @posts = Post.order(likes_count: :DESC)
    @sidebar_posts = Post.order(likes_count: :DESC)
  end
end
