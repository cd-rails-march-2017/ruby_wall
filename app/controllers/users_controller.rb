class UsersController < ApplicationController
  def index
  end

  def create
    user = User.find_by_username(params[:username])
    if user
      session[:username] = user.username
      session[:user_id] = user.id
    else
      user = User.create(username: params[:username])
      session[:username] = user.username
      session[:user_id] = user.id
    end
    redirect_to '/posts'
  end

  def logout
    session.clear
    redirect_to '/'
  end
end
