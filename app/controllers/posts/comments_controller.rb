class Posts::CommentsController < PostsController

  def create
    comment = PostComment.new(post_params)
    if comment.save
      redirect_to post_path(params[:post_id]), flash: {notice: "コメントの投稿が完了しました。"}
    else
      redirect_to post_path(params[:post_id]), flash: {alert: "#{comment.errors.full_messages.first}"}
    end
  end

  private

  def post_params
    params.require(:post_comment).permit(:body).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
