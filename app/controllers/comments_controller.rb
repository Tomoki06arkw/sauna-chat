class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
    redirect_to chat_path(@comment.chat)
    else
    @chat = @comment.chat
    @comments = @chat.comments
    render '/chats/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, chat_id: params[:chat_id])
  end
end
