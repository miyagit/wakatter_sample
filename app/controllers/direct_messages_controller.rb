class DirectMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_other_user, only: [:index, :create]

  def index
    @messages = DirectMessage.where(
      "(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)",
      current_user.id, @other_user.id, @other_user.id, current_user.id
    ).order(created_at: :asc)
    @message = DirectMessage.new
  end

  def create
    @message = current_user.sent_messages.build(message_params)
    @message.receiver = @other_user

    if @message.save
      redirect_to user_direct_messages_path(@other_user), notice: 'メッセージを送信しました'
    else
      @messages = DirectMessage.where(
        "(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)",
        current_user.id, @other_user.id, @other_user.id, current_user.id
      ).order(created_at: :asc)
      render :index
    end
  end

  private

  def set_other_user
    @other_user = User.find(params[:user_id])
    redirect_to root_path, alert: '自分自身にメッセージを送ることはできません' if @other_user == current_user
  end

  def message_params
    params.require(:direct_message).permit(:content)
  end
end
