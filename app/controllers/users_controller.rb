class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def destroy
  end

  def create
    if Residence.where(user_id: current_user.id).exists?
      target = Residence.where(user_id: current_user.id)
      begin  
        target.update(residence_params)
      rescue ActiveRecord::RecordInvalid => e
        render :index
      end
      if session[:item_id].nil?
        redirect_to user_residences_path(current_user.id)
      else
        redirect_to item_purchases_path(item_id: session[:item_id])
      end
    else
      @residence = Residence.new(residence_params)
      begin
        @residence.save!
        if session[:item_id].nil?
          redirect_to user_residences_path(current_user.id)
        else
          redirect_to item_purchases_path(item_id: session[:item_id])
        end
      rescue ActiveRecord::RecordInvalid => e
        render :index
      end
    end
  end
end
