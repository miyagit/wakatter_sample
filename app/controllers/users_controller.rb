class UsersController < ApplicationController
  # UsersControllerに追加するメソッド
  
  def show
    @user = User.find(params[:id])
  end
  
  def dm
    binding.pry
    @user = User.find(params[:id])
    @message_room = current_user.find_or_create_dm_room_with(@user)
    redirect_to message_room_path(@message_room)
  end
end
