class ToppagesController < ApplicationController
  def index
    @parents = []
    Category.where(ancestry: nil).each do |parent|
      @parents << parent.name
    end
  end
end
