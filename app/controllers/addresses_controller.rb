class AddressesController < ApplicationController
    # before_action :authenticate_user!

    # def step3
    #     session[:last_name] = address_params[:last_name]
    #     session[:first_name] = address_params[:first_name]
    #     session[:last_name] = address_params[:last_name_kana]
    #     session[:first_name] = address_params[:first_name_kana]
    #     @address = Address.new
    # end

    # def create
    #     @address = Address.new(address_params)
    #     if @address.save
    #         redirect_to controller: '/signup', action: 'done'
    #     else
    #         render "step3"
    #     end
    # end

    # private
    # def address_params
    #     params.require(:address).permit(:address_last_name, :address_first_name, :address_last_name_kana, :address_first_name_kana)
    # end
end