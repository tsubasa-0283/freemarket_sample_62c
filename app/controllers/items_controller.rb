class ItemsController < ApplicationController
    def index
        @items = Items.includes(:images).order('create_at DESC')
    end
    
    def new
        @item = Item.new
        @item.images.new
        @category = Category.all
        # ancestryのカテゴリーページを作成するためにコメントアウト
    #     @category_parent_array = ["---"]
    #   Category.where(ancestry: nil).each do |parent|
    #      @category_parent_array << parent.name
    #   end
        # @categories = Category.where(sub: params[:sub], sub_sub: params[:sub_sub])
        # gon.length = 0
    end
    
    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end

    private

    def item_params

    end
    
end