class ToppageController < ApplicationController
  def index
    @category = Category.all.order("id ASC").limit(19)
  end
end
