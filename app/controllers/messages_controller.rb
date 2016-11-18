class MessagesController < ApplicationController
  def index
    @groups = Group.all
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    @members = @group.members
	  @message = Message.new

    respond_to do |format|
      format.html { }
      format.json { render json: {
        name: current_user.name,
        messages: @messages
        }
      }
    end

  end

  def create
    @message = Message.new(message_params)
    @group = Group.find(params[:group_id])

    respond_to do |format|
    	if @message.save
        format.html {redirect_to group_messages_path(@group)}
        format.json {render json:{
          name: @message.user.name,
          date: @message.created_at.strftime('%Y年%m月%d日 %H:%M'),
          body: @message.body,
          image: @message.image.url
          }
        }

    	else
    	  redirect_to group_messages_path(@group), flash: {alert: '本文を入力してください。'}
      end

    end

  end

  private
  def message_params
	  params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
