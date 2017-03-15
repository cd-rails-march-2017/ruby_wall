class UsersController < ApplicationController
  def index
  end

  def create
    user = User.where("username = ?", params[:username])
    if user
      session[:user] = user
    else
      user = User.create(username: params[:username])
      session[:user] = user
    end
    redirect_to '/posts'
  end
end
