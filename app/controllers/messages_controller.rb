class MessagesController < ApplicationController
  def index
    @inbox_messages = current_user.received_messages
    @outbox_messages = current_user.sent_messages
  end

  def show
  end

  def new
    @message = Message.new
    @recipient = User.find(params[:user_id])
  end

  def create
    @message = Message.create(subject: params[:message]["subject"], content: params[:message]["content"])
    @recipient = User.find(params[:message]["recipient"].to_i)
    @message.sender = current_user
    @message.recipient = @recipient
    @message.save
    flash[:notice] = "Message sent"
    redirect_to user_path(@recipient)
  end
end
