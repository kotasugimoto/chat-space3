class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]

  def index
    @groups = Group.all
  end
  def new
    @group = Group.new
  end
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), flash: {notice: 'グループが作成されました。'}
    else
      render 'new'
      flash[:alert] = 'グループの作成に失敗しました'
    end
  end
  def edit
  end
  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), flash: {notice: '登録情報が変更されました。'}
    else
      render 'edit'
      flash[:alert] = 'グループの作成に失敗しました'
    end
  end
  def show

  end
  def set_group
    @group = Group.find(params[:id])
  end

  private
  def group_params
    params.require(:group).permit(:name, { user_ids:[] })
  end
end
