class BuyersController < ApplicationController
  require 'payjp'
  before_action :set_card, :set_item
  before_action :authenticate_user!

  def index
    if current_user.id == @item.seller_id or @item.buyer_id.present?
      redirect_to root_path
    else
      if @card.blank?
        #登録された情報がない場合にカード登録画面に移動
        redirect_to new_card_path
      else
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(@card.customer_id) 
        #カード情報表示のためインスタンス変数に代入
        @default_card_information = customer.cards.retrieve(@card.card_id)
      end
    end
  end

  def pay
      if current_user.id == @item.seller_id or @item.buyer_id.present?
        redirect_to root_path
      else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp::Charge.create(
        :amount => @item.price,
        :customer => @card.customer_id,
        :currency => 'jpy',
      )
      redirect_to done_item_buyers_path
      end
  end

  def done
    @item_buyer = Item.find(params[:item_id])
    @item_buyer.update( buyer_id: current_user.id)
  end

  private

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end