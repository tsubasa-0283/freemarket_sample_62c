# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user 
      session[:user_id] = user.id
      sign_in(user)
      binding.pry
      flash[:alert] = "ログインしました"
      redirect_to root_path
    else
      session[:user_id] = params[:user_id]
      binding.pry
      render new_user_session_path
    end
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def destroy
    # forget(current_user)
    # session.delete(:user_id)       # セッションのuser_idを削除する
    # @current_user = nil 
    log_out if logged_in?    
    # binding.pry
    redirect_to new_user_session_path
  end
end

