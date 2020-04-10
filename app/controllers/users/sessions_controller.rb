# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def create
    if  session[:user_id]
      binding.pry
      redirect_to root_path
    else
      session[:user_id] = params[:user_id]
      binding.pry
      render new_user_session_path
    end
  end

  def destroy
    log_out if logged_in?
    session[:user_id].clear
    redirect_to root_path
  end
end

