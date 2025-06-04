class MessageRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message_room, only: [:show]

  def index
    @message_rooms = current_user.message_rooms
                                .includes(:users, messages: :user)
  end

  def show
    @message = Message.new
    @messages = @message_room.messages.includes(:user).order(created_at: :asc)
    
    # 未読メッセージを既読に更新（readカラムがある場合）
    # @message_room.messages
    #              .where(user_id: @message_room.other_user(current_user).id, read: false)
    #              .update_all(read: true)
    
    @other_user = @message_room.other_user(current_user)
  end

  def create
    @other_user = User.find(params[:user_id])
    @message_room = current_user.find_or_create_dm_room_with(@other_user)
    redirect_to message_room_path(@message_room)
  end

  private

  def set_message_room
    @message_room = current_user.message_rooms.find(params[:id])
  end
end
