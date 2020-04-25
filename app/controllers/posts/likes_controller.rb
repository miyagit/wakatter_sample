class Posts::LikesController < PostsController
  before_action :set_post

  def create
    @post.post_likes.create!(user_id: current_user.id)
  end

  def destroy
    @post.post_likes.find_by(user_id: current_user.id).destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
