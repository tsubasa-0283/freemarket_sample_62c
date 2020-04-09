# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def create
    if  session[:user_id]
      redirect_to root_path
    else
      session[:user_id] = params[:user_id]
      render new_user_session_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
