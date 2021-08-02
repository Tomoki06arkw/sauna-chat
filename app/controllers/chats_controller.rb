class ChatsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @chats = Chat.all.order("created_at DESC")
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

  def show
    @chat = Chat.find(params[:id])
  end

  def edit
    @chat = Chat.find(params[:id])
  end

  def update
    @chat = Chat.find(params[:id])
    if @chat.update(chat_params)
      redirect_to chat_path
    else
      render :edit
    end
  end

  def destroy
    @chat = Chat.find(params[:id])
    if @chat.destroy
    redirect_to root_path
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
