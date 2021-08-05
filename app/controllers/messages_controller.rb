class MessagesController < ApplicationController
  def index
    @messages = Message.all.order("created_at DESC")
    @message = Message.new
  end

  def create
    @message = Message.new(text: params[:message][:text])
    if @message.save
      ActionCable.server.broadcast '/.message_channel', content: @message
    end
  end

end
