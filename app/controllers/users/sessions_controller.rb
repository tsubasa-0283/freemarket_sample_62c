# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
      log_in user
      binding.pry
      redirect_to root_path
      #後からログインユーザーとログインしていないユーザーの飛ばし先を分ける
    # else
    #   flash.now[:error] = "Invalid email/password combination "
    #   render action: :step1
    # end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

end
