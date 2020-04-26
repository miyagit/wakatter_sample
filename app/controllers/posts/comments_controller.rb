class Posts::CommentsController < PostsController

  def create
    comment = PostComment.create(post_params)
    redirect_to post_path(params[:post_id]), flash: {notice: "コメントの投稿が完了しました。"}
  end

  private

  def post_params
    params.require(:post_comment).permit(:body).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
