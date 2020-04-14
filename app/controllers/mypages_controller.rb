class MypagesController < ApplicationController
  before_action :set_parents

  def index
  end

  def logout
  end

  private
  def set_parents
    @category_parent_array = Category.where(ancestry: nil)
  end
end
