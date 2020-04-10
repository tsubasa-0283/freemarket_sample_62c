# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :save_step1_to_session, only: :step2
  before_action :save_step2_to_session, only: :step3

  def step1
    @user = User.new
    @user.build_address #userモデルとaddressモデルの関連付け
  end

  def step2
    @user = User.new
    @user.build_address
  end

  def step3
    @user = User.new
    @user.build_address
  end

  def create
    @user = User.new(
      nickname: session[:nickname],  #ここで userモデルのsessionを引数で渡す
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      tel: session[:tel],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
    )
    @user.build_address(user_params[:address_attributes]) #今回のビューで入力された情報を代入する。

    if @user.save
      #ここでidをsessionに入れることでログイン状態に持っていける
      session[:user_id] = @user.id
      binding.pry
      redirect_to root_path
    else
      flash.now[:alert] = @user.errors.full_messages
      render action: :step1
    end
  end

  def done
    #ログイン状態を保持する記述
    # sign_in User.find(session[:user_id]) unless user_signed_in?
    binding.pry
    redirect_to root_path
  end

  #step1以降のバリデーション追加

  def save_step1_to_session
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]

    # バリデーション用に仮でインスタンスを作成
    @user = User.new(
      nickname: session[:nickname], #sessionに保存された値を返す
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day]
      )
    render action: :step1 unless @user.valid?(:save_step1_to_session)
  end

  #ステップ2以降のバリデーションの追加

  def save_step2_to_session
    session[:tel] = user_params[:tel] #step2で入力された情報をsessionに代入する
    # バリデーション用に仮でインスタンスを作成
    @user =User.new(
      email: session[:email],
      password: session[:password],
      tel: session[:tel]
    )
    render '/users/signup/sms' unless @user.valid?(:save_step2_to_session)
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :tel,
      :birth_year,
      :birth_month,
      :birth_day,
      address_attributes: [
        :id,
        :address_first_name,
        :address_last_name,
        :address_first_name_kana,
        :address_last_name_kana,
        :address_tel,
        :post_number,
        :prefecture_id,
        :city,
        :address,
        :building
      ]
    )
  end
end