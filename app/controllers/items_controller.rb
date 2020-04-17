class ItemsController < ApplicationController
    before_action :set_item, only:[:destroy, :show, :edit, :update]
    before_action :set_category
    before_action :confirmation, only: [:new, :edit]

    def index
        @items = Item.includes(:images).order('created_at DESC')
    end

    def new
        @item = Item.new
        @item.images.new
        @item.build_brand
        @category_parent_array = Category.where(ancestry: nil)
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
      @item.seller_id = current_user.id
      if @item.save
        redirect_to root_path, notice: "出品しました"
      else
        redirect_to new_item_path, alert: "必須項目を入力してください"
      end
    end

    def edit
      @category = @item.category
      @child_categories = Category.where('ancestry = ?', "#{@category.parent.ancestry}")
      @grand_child = Category.where('ancestry = ?', "#{@category.ancestry}")
      @condition_array = Condition.all
      @item.build_brand
    end

    def update
      if @item.update(item_params)
        redirect_to root_path, notice: "編集しました"
      else
        redirect_to edit_item_path, alert: "必須項目を入力してください"
      end
    end

    # 子カテゴリー
    def category_children
      children = Category.find(params[:name]).name
      @category_children = Category.find_by(name: children, ancestry: nil ).children
    end

# 商品詳細表示
    def show
      if user_signed_in?
        @item = Item.find(params[:id])
        @user = User.find(@item.seller_id)
        @box = Item.order("RAND()").limit(6)
        @smallcategory = Category.find(@item.category_id)
        @category = @smallcategory.parent # unless Category.find(@item.category_id)
        @bigcategory = @category.parent
        # @size = Size.find(@item.size_id)
        @brand = Brand.find(@item.brand_id)
        @delivery = DeliveryDay.find(@item.delivery_day_id)
        @address = Prefecture.find(@item.prefecture_id)
        @condition = Condition.find(@item.condition_id)
        @postage = Postage.find(@item.postage_id)
        # binding.pry
      else
        render index
      end
    end

    def destroy
      if user_signed_in? && current_user.id == @user.id
        if @item.destroy
          redirect_to root_path, notice: "削除しました"
        else
          redirect_to root_path, alert: "削除に失敗しました"
        end
      else
        redirect_to  new_user_session_path
      end
    end

    # ログイン状態の確認
    def confirmation  #ログインしていない場合ははユーザー登録に移動
      unless user_signed_in?
        redirect_to user_session_path, alert: "ログインしてください"
      end
    end




    private

    def set_item
      @item = Item.find(params[:id])
      @images = @item.images
    end

    def item_params
      params.require(:item).permit(:name, :price, :description, :category_id, :size_id, :prefecture_id, :condition_id, :delivery_day_id, :postage_id, :seller_id, :buyer_id, brand_attributes: [:id,:name], images_attributes: [:src, :_destroy, :id] ).merge(user_id: current_user.id, seller_id: current_user.id)
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

end