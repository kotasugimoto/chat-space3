class MessagesController < ApplicationController
  def index
	@message = Message.new
  end

  def create
	@message = Message.create(message_params)
	if @message.save
	  lash[:success] = "保存されました！"
	  redirect_to action: :index
	else
	  flash[:error] = "空欄！保存できません！"
	  render:index
    end
  end

  private
  def message_params
	params.require(:message).permit(:body)
  end
end
