class PostsController < ApplicationController
  def index
    unless session[:user_id]
      redirect_to "/"
    end
    @posts = Post.all.order('created_at DESC')
    @comments = Comment.all
    @user = session[:username]
  end

  def create
    Post.create(content: params[:content], user_id: session[:user_id])
    redirect_to "/posts"
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to "/posts"
  end
end
