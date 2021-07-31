class ChatsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  private
  
  def move_to_index
    unless user_singed_in?
      redirect_to aciton: index
    end
  end

  def chat_params
    params.require(:chat).permit(:image, :area_id, :price, :sauna_name, :description).merge(user_id: current_user.id)
end
