class Item < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :images
    accepts_nested_attributes_for :images, allow_destroy: true
    belongs_to :category, optional: true
    belongs_to :condition
    belongs_to :brand, optional: true
    belongs_to :size
    belongs_to :postage
    belongs_to :DeliveryDay
end
