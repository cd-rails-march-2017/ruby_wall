class UsersController < ApplicationController
  def index
  end

  def create
    user = User.find_by_username(params[:username])
    if user
      if user[:password] == params[:password]
        session[:username] = user.username
        session[:user_id] = user.id
        redirect_to '/posts'
      else
        flash[:error] = ["Incorrect Password. Please re-enter your password"]
        redirect_to '/'
      end
    else
      user = User.create(username: params[:username], password: params[:password])
      session[:username] = user.username
      session[:user_id] = user.id
      if user.errors.full_messages[0]
        flash[:error] = user.errors.full_messages
        redirect_to '/'
      else
        redirect_to '/posts'
      end
    end
  end

  def logout
    session.clear
    redirect_to '/'
  end
end
