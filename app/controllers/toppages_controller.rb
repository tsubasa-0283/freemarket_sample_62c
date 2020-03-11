class ToppagesController < ApplicationController
  def index
    @parents = []
    Category.where(ancestry: nil).pluck do |parent|
      @parents << parent.name
    end
  end
end
