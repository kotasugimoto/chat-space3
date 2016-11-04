class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to messages_path
    else
      redirect_to action: 'new'
    end
  end
  def edit

  end
  def index

  end
  def update

  end
  private
  def group_params
    params.require(:group).permit(:group_name, { user_ids:[] })
  end
end
