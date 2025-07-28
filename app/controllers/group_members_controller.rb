class GroupMembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  before_action :set_group_member, only: [:update, :destroy]

  def create
    @group_member = @group.group_members.build(user: current_user, status: 'pending')

    if @group_member.save
      redirect_to @group, notice: 'グループ参加申請を送信しました。'
    else
      redirect_to @group, alert: '申請に失敗しました。'
    end
  end

  def update
    return redirect_to @group, alert: '権限がありません。' unless current_user.admin_of?(@group)

    case params[:action_type]
    when 'approve'
      @group_member.update(status: 'accepted')
      redirect_to @group, notice: 'メンバーを承認しました。'
    when 'reject'
      @group_member.update(status: 'rejected')
      redirect_to @group, notice: 'メンバー申請を拒否しました。'
    when 'make_admin'
      @group_member.update(role: 'admin')
      redirect_to @group, notice: 'メンバーを管理者にしました。'
    when 'remove_admin'
      @group_member.update(role: 'member')
      redirect_to @group, notice: '管理者権限を削除しました。'
    else
      redirect_to @group, alert: '無効な操作です。'
    end
  end

  def destroy
    if current_user == @group_member.user || current_user.admin_of?(@group)
      @group_member.destroy
      redirect_to @group, notice: 'グループから退出しました。'
    else
      redirect_to @group, alert: '権限がありません。'
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_group_member
    @group_member = @group.group_members.find(params[:id])
  end
end
