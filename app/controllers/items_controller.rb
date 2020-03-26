class ItemsController < ApplicationController
    before_action :set_item, only:[:destroy, :show, :edit, :update]
    before_action :set_category
    def index
        @items = Items.includes(:images).order('create_at DESC')
    end

    def new
        @item = Item.new
        @item.images.new

        #セレクトボックスの初期値
        @category_parent_array = Category.where(ancestry: nil)
        # データベースから親カテゴリーのみを抽出し、配列化
        # Category.where(ancestry: nil).each do |parent|
        #   @category_parent_array << parent.name
        # end
    end
    # 親カテゴリーが選択された後に動くアクション
    def get_category_children
      # 選択された親カテゴリーに紐づく子カテゴリーの配列を取得する
      @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
    end
    # 子カテゴリーが選択された後に動くアクション
    def get_category_grandchildren
      # 選択された子カテゴリーに紐づく孫カテゴリーの配列を取得する
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end

    # 孫カテゴリーが選択された後に動くアクション
    def get_size
      selected_grandchild = Category.find("#{params[:grandchild_id]}") #孫カテゴリーを取得
      if related_size_parent = selected_grandchild.sizes[0] #孫カテゴリーの親と紐づくサイズ（親）があれば取得
        @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得する
      else
        selected_child = Category.find("#{params[:grandchildren_id]}").parent #孫カテゴリーの親を取得する
        if related_size_parent = selected_child.sizes[0] #孫カテゴリーの親と紐づくサイズ（親）があれば取得
          @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得
        end
      end
    end

    def create
      @item = Item.new(item_params)
      # @item.status = 0
      @item.seller_id = "1"
      if @item.save
        redirect_to root_path, notice: "出品しました"
      else
        render :new unless @item.valid? alert: "必須項目を入力してください"
      end
    end

    def edit
    end

    def update
      @item = Item.find(params[:id])
      @images = @item.images

      # 登録画像のidの配列を生成
      ids = @item.images.map{|image| image.id}
      # 登録済み画像のうち、編集後もまだ残っている画像のidの配列を生成する（文字列から数値に変換する）
      exist_ids = registered_images_params[:ids].map[&:to_i]
      # 登録済み画像が残っていない場合、配列を空にする
      exist_ids.clear if exist_ids[0] == 0

      if(exist_ids.length != 0 || new_image_params[:images][0] != "") && @item.update!(item_update_params)
        
        # 登録済み画像のうち削除ボタンを押した画像を削除する
        delete_ids = ids - exist_ids
        delete_ids each do |id|
          @item.images.find(id).destroy
        end
      end

      # 新規登録画像があれば保存する
      unless new_image_params[:images][0] == ""
        new_image_params[:images].each do |image|
          @item.images.ceate(src: image, item_id: @item_id)
        end
      end

      format.js{rnder ajax_redirect_to(item_path(@item))}

      else
        flash[:alert] = "未入力項目があります"
        render :edit
      end
    end

    def destroy
    end


    private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :price, :description, :category_id, :size_id, :prefecture_id, :condition_id, :delivery_day_id, :postage_id, :brand_id, images_attributes: [:src] ).merge(seller_id: "1")
    end

    def item_update_params
      params.require(:item).permit(:name, :price, :description, :category_id, :size_id, :brand_id, :prefecture_id, :condition_id, :delivery_day_id, :postage_id )
    end

    def registered_images_params
      params.require(:registered_images_ids).permit({ids: []})
    end

    def new_image_params
      params.require(:new_images).permit({images: []})
    end

    def set_category
      @category_parent_array = Category.where(ancestry: nil)
    end

    