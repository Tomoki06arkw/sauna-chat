class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(chat_id: params[:chat_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @chat = Chat.find(params[:chat_id])
    @like = current_user.likes.find_by(chat_id: @chat.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
