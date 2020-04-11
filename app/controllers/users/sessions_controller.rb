# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      redirect_to root_path
    else
      session[:user_id] = params[:user_id]
      render :new
    end
  end

  def destroy
    session[:user_id].clear
    redirect_to root_path
  end
end

