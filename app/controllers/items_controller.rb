class ItemsController < ApplicationController
    def index
        @items = Items.includes(:images).order('create_at DESC')
    end
    
    def new
        @item = Item.new
        @item.images.build
        # gon.length = 0
    end
    
    def create
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
end