class MessagesController < ApplicationController

	def index

	end

	def inbox
    @reception_messages = Message.where(recever_id: current_user.id).order('updated_at DESC').page(params[:page]).per(5)
	end

	def outbox
	  @send_messages = current_user.messages.order('updated_at DESC').page(params[:page]).per(5)
	end


  def show
    @message = Message.find(params[:id])
	end

	def create
    Message.create(title: message_params[:title], text: message_params[:text], article_id: message_params[:article_id], recever_id: message_params[:recever_id], user_id: current_user.id)
  end

  private
  def message_params
    params.permit(:title, :text, :article_id, :recever_id)
  end

end
