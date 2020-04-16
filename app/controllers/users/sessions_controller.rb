# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user 
      session[:user_id] = user.id
      bypass_sign_in(user)
      flash[:alert] = "ログインしました"
      redirect_to root_path
    else
      session[:user_id] = params[:user_id]
      render new_user_session_path
    end
  end

  

  def destroy
    session.delete(:user_id)                                                    # セッションのuser_idを削除する
    @current_user = nil     
    flash[:alert] = "ログアウトしました"
    binding.pry
    redirect_to root_path
  end
end

