class ToppagesController < ApplicationController
  def index
    @category_parent_array = Category.where(ancestry: nil)
  end
end
