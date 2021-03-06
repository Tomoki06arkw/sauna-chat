class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = Kaminari.paginate_array(Chat.includes(:user).reverse_order).page(params[:page]).per(4)
  end
end
