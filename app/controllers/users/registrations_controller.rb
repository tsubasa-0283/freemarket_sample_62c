# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  # before_action :create, only: [:create, :index]

  def step1

    @user = User.new
    @user.build_address 
    # binding.pry
  end

  def step2
    session[:nickname] = params[:user][:nickname]
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    session[:password_confirmation] = params[:user][:password_confirmation]
    session[:first_name_kana] = params[:user][:first_name_kana]
    session[:first_name] = params[:user][:first_name]
    session[:last_name] = params[:user][:last_name]
    # session[:birsthday] = birthday_join
    
    @user = User.new #(nickname:session[:nickname], email: session[:email], password: session[:password],  first_name_kana: session[:first_name_kana],last_name_kana: session[:last_name_kana], first_name: session[:first_name], last_name: session[:last_name], birthday: session[:birthday],phone: params[:user][:phone])
    @user.build_address
    # binding.pry
  end

  def step3
    session[:address_last_name] = user_params[:address_last_name]
    session[:address_first_name] = user_params[:address_first_name]
    session[:address_last_name_kana] = user_params[:address_last_name_kana]
    session[:address_first_name_kana] = user_params[:address_first_name_kana]
    @user = User.new
    @address = Address.new
    @user.build_address
    # binding.pry
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name_kana: session[:first_name_kana],
      last_name_kana: session[:last_name_kana],
      first_name: session[:first_name],
      last_name: session[:last_name],
      birsthday: session[:birsthday],
      tel: params[:user][:tel]
    )
    # binding.pry
    if @user.save
      session[:id] = @user.id
      # redirect_to controller: addresses_new_path, action: 'step3'
      sign_in User.find(@user.id) #ログイン状態を保持する記述
      redirect_to users_signup_done_path
    else
      redirect_to step1, notice: '初めから入れなおして下さい'
    end
    
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :birthday

    )
  end

  def birsthday_join
    year = params[:user]["birthday(1i)"]
    month = params[:user]["birthday(2i)"]
    day = params[:user]["birthday(3i)"]
    birthday = year.to_s + "-" + month.to_s + "-" + day.to_s
  end
end
