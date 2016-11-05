class MessagesController < ApplicationController
  def index
    @groups = Group.all
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    @members = @group.members
	  @message = Message.new
  end

  def create
	  @message = Message.new(message_params)
    @group = Group.find(params[:group_id])
	if @message.save
	  redirect_to group_messages_path(@group), flash: {alert: '保存されました'}
	else
	  redirect_to group_messages_path(@group), flash: {alert: '本文を入力してください。'}
    end
  end

  private
  def message_params
	  params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
