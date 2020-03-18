class ToppagesController < ApplicationController
  def index
    @parents = []
    Category.where(ancestry: nil).pluck do |parent|
      @parents << parent.name
    end
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
 end
end
