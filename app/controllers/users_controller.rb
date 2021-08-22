class UsersController < ApplicationController
  before_action move_to_index 

  def show
    @user = User.find(params[:id])
    @chats = Kaminari.paginate_array(Chat.includes(:user).reverse_order).page(params[:page]).per(4)
  end
end
