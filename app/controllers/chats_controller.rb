class ChatsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @chats = Chat.all
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.create(chat_params)
    if @chat.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def move_to_index
    unless user_signed_in?
      redirect_to aciton: index
    end
  end

  def chat_params
    params.require(:chat).permit(:image, :area_id, :price, :sauna_name, :description).merge(user_id: current_user.id)
  end
  
end
