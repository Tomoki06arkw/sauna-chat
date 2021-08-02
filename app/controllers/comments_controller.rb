class CommentsController < ApplicationController

  def create
    Comment.create(comment_params)
  end

  private
  def comment_params
    require.params(:comment).permit(text).merge(user_id: current_user.id, chat_id: params[:chat_id])
  end
end
