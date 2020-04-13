class Posts::CommentsController < PostsController

  def create
    comment = PostComment.create(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post_comment).permit(:body).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
