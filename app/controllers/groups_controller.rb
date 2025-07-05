class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :update, :destroy]

  def index
    @groups = Group.all.order(created_at: :desc)
  end

  def show
    @group_posts = @group.posts.order(created_at: :desc)
    @members = @group.group_members.accepted.includes(:user)
    @pending_members = @group.group_members.pending.includes(:user) if current_user&.admin_of?(@group)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.creator = current_user

    if @group.save
      # Make creator an admin member
      @group.group_members.create!(user: current_user, role: 'admin', status: 'accepted')
      redirect_to @group, notice: 'グループが作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'グループが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, notice: 'グループが削除されました。'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def check_admin
    redirect_to @group, alert: '管理者権限がありません。' unless current_user.admin_of?(@group)
  end
end
