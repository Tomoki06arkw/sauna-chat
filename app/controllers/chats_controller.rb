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
end
