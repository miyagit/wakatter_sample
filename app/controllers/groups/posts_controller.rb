class Groups::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  before_action :check_membership, except: [:new, :create]

  def index
    @posts = @group.posts.order(created_at: :desc)
    @sidebar_posts = @group.posts.order(likes_count: :desc).limit(10)
  end

  def show
    @post = @group.posts.find(params[:id])
  end

  def new
    redirect_to @group, alert: 'グループメンバーのみ投稿できます。' unless current_user.member_of?(@group)
    @post = Post.new
  end

  def create
    redirect_to @group, alert: 'グループメンバーのみ投稿できます。' unless current_user.member_of?(@group)
    
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      @group.group_posts.create!(post: @post)
      redirect_to [@group, @post], notice: 'グループに投稿しました。'
    else
      render :new
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def check_membership
    redirect_to @group, alert: 'グループメンバーのみアクセスできます。' unless current_user.member_of?(@group)
  end

  def post_params
    params.require(:post).permit(:title, :url, :description, :category_id, :image)
  end
end
