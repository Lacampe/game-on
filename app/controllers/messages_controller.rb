class MessagesController < ApplicationController
  def index
    @inbox_messages = current_user.received_messages
    @outbox_messages = current_user.sent_messages
  end

  def show
  end
end
