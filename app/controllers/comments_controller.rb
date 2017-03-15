class CommentsController < ApplicationController
  def create
    Comment.create(content: params[:content], user: session[:user], post_id: params[:id])
    redirect_to "/posts"
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to "/posts"
  end
end
