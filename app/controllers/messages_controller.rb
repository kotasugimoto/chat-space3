class MessagesController < ApplicationController

	def index
		@message = Message.new
	end

	def new
		@message = Message.new
	end

	def create
		Message.create(message_params)
		redirect_to controller: :messages, action: :index
	end

	private
	def message_params
		params.permit(:body)
	end
end
