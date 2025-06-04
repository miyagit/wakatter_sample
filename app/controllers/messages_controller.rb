class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message_room

  def create
    @message = @message_room.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to message_room_path(@message_room)
    else
      @messages = @message_room.messages.includes(:user)
      render 'message_rooms/show'
    end
  end

  private

  def set_message_room
    @message_room = current_user.message_rooms.find(params[:message_room_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
