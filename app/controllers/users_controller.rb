class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def destroy
  end

  def create
    binding.pry
    if  session[:user_id]
      binding.pry
      redirect_to root_path
    else
      session[:user_id] = params[:user_id]
      binding.pry
      render new_user_session_path
    end
  end

end
