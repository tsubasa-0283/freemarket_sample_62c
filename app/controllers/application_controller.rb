class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
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
    ])
  end
end
