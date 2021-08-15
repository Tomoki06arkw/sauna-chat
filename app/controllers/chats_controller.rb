class ChatsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_chat, only: [:show, :edit, :update, :destroy]


  def index
    @chats = Kaminari.paginate_array(Chat.includes(:user).reverse_order).page(params[:page]).per(6)

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
    @comment = Comment.new
    @comments = @chat.comments.includes(:user)
  end

  def edit
  end

  def update
    if @chat.update(chat_params)
      redirect_to chat_path
    else
      render :edit
    end
  end

  def search
    @chats = Chat.search(params[:keyword])
  end

  def destroy
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
    params.require(:chat).permit(:image, :area_id, :price_id, :sauna_name, :description).merge(user_id: current_user.id)
  end

  def set_chat
    @chat = Chat.find(params[:id])
  end
end
