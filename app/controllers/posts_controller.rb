class PostsController < ApplicationController
  def index
    unless session[:user]
      redirect_to "/"
    end
    @posts = Post.all
    @comments = Comment.all
  end

  def create
    Post.create(content: params[:content], user: session[:user])
    redirect_to "/posts"
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to "/posts"
  end
end
