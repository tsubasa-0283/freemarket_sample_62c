class ItemsController < ApplicationController
    before_action :set_item, only:[:destroy, :show, :edit, :update]
    def index
        @items = Items.includes(:images).order('create_at DESC')
    end

    def new
        @item = Item.new
        @item.images.new
        @category = Category.all
        #セレクトボックスの初期値
        @category_parent_array = ["---"]
        # データベースから親カテゴリーのみを抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
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

    # 以下全て、formatはjsonのみ
    # 親カテゴリーが選択された後に動くアクション
    def get_category_children
      # 選択された親カテゴリーに紐づく子カテゴリーの配列を取得する
      @get_category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
    end

    # 子カテゴリーが選択された後に動くアクション
    def get_category_grandchildren
      # 選択された子カテゴリーに紐づく孫カテゴリーの配列を取得する
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end

    # 孫カテゴリーが選択された後に動くアクション
    def get_size
      selected_grandchild = Category.find("#{params[:grandchildren_id]}") #孫カテゴリーを取得
      if related_size_parent = selected_grandchild.sizes[0] #孫カテゴリーの親と紐づくサイズ（親）があれば取得
        @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得する
      else
        selected_child = Category.find("#{params[:grandchildren_id]}").parent #孫カテゴリーの親を取得する
        if related_size_parent = selected_child.sizes[0] #孫カテゴリーの親と紐づくサイズ（親）があれば取得
          @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得
        end
      end
    end

    private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :price, :description, :category_id, :size_id, :brand_id, :prefecture_id, :condition_id, :delivery_day_id, :postage_id, images_attributes: [:image_url] )
    end

end