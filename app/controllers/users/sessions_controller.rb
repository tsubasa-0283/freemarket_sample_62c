# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user 
      session[:user_id] = session[:user_id]
      binding.pry
      redirect_to root_path
    else
      session[:user_id] = params[:user_id]
      binding.pry
      render new_user_session_path
    end
  end

  def destroy
    session[:user_id].clear
    redirect_to root_path
  end
end

