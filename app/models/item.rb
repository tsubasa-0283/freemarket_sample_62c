class Item < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :images
    belongs_to :category, optional: true
end
