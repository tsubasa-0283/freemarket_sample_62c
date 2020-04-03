# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :save_step1_to_session, only: :step2
  # before_action :save_step2_to_session, only: :step3

  def step1
    @user = User.new
    @user.build_address #userモデルとaddressモデルの関連付け
    # binding.pry
  end

  def step2
    # session[:user_params] = user_params #uesrモデルの値を代入する
    session[:user_params] = user_params #step1の値をsessionに代入する
    @user = User.new
    @user.build_address
    # binding.pry
  end


  def step3
    session[:user_params_after_step2] = user_params #step2で入力された情報をsessionに代入する
    session[:user_params].merge!(session[:user_params_after_step2]) #step1とstep2の値を連結させる
    @user = User.new
    @user.build_address
    # binding.pry
  end

  # def user_create
  #   session[:user_params].session[:user_params_after_step1].merge!(session[:user_params])  #step1で入力された値とstep2の値を連結させる
  #   binding.pry
  # end


  def create
    @user = User.new(session[:user_params],) #ここで userモデルのsessionを引数で渡す
    # @user = User.new(session[:user_params_after_step1]) #ここでstep2のuserモデルのsessionを引数に渡す。
    @user.build_address(user_params[:address_attributes]) #今回のビューで入力された情報を代入する。
    # binding.pry
    if @user.save
      session[:user_id] = @user.id
      #ここでidをsessionに入れることでログイン状態に持っていける
      redirect_to users_signup_done_path
    else
      render action: :step1
    end

  end

  def done
    sign_in User.find(@user.id) #ログイン状態を保持する記述
    unless user_signed_in?
    end
    # binding.pry
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
      :birth_date,
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

  # "user"=><ActionController::Parameters {"address_attributes"=>{"address_last_name"=>"山田", "address_first_name"=>"太郎", "address_last_name_kana"=>"山田", "address_first_name_kana"=>"タロウ", "post_number"=>"1300025", "prefecture_id"=>"33", "city"=>"墨田区千歳", "address"=>"1丁目3番地２号", "building"=>"", "tel"=>""}}

  # def birsthday_join
  #   year = params[:user]["birthday(1i)"]
  #   month = params[:user]["birthday(2i)"]
  #   day = params[:user]["birthday(3i)"]
  #   birthday = year.to_s + "-" + month.to_s + "-" + day.to_s
  # end
end