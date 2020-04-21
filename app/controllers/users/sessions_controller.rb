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
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    redirect_to root_path, alert: "ログアウトしました"
  end

end

