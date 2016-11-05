class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @message = Message.new
  end
  def new
    @group = Group.new
  end
  def create
    @group = Group.create(create_params)
    if @group.save
      redirect_to group_messages_path(@group), flash: {notice: 'グループが作成されました。'}
    else
      redirect_to action: 'new'
      flash[:alert] = 'グループの作成に失敗しました'
    end
  end
  def edit
    @group = Group.find(params[:id])
    @members = @group.members
  end
  def update
    @group = Group.find(params[:id])
    @members = @group.members
    if @group.update(update_params)
      redirect_to group_messages_path(@group), flash: {notice: '登録情報が変更されました。'}
    else
      redirect_to action: 'new'
      flash[:alert] = 'グループの作成に失敗しました'
    end
  end
  def show

  end
  private
  def update_params
    params.require(:group).permit(:group_name, { user_ids: []})
  end
  def create_params
    params.require(:group).permit(:group_name, { user_ids:[] })
  end
end
