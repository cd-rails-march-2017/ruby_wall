class CommentsController < ApplicationController
  def create
    Comment.create(content: params[:content], user_id: session[:user_id], post_id: params[:id])
    redirect_to "/posts"
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to "/posts"
  end
end
