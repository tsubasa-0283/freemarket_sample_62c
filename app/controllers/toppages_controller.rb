class ToppagesController < ApplicationController
  def index

    @parents = []
    Category.where(ancestry: nil).each do |parent|
      @parents << parent.name
    @items = Item.limit(9).includes(:images).order("created_at DESC")
    end
  end
end