class MessagesController < ApplicationController
  def index
	  @message = Message.new
  end

  def create
	  @message = Message.new(message_params)
	if @message.save
	  flash[:success] = "保存されました！"
	  redirect_to action: :index
	else
	  flash[:error] = "空欄！保存できません！"
	  render :index
    end
  end

  private
  def message_params
	  params.require(:message).permit(:body).merge(user_id: current_user.id)
  end
end
