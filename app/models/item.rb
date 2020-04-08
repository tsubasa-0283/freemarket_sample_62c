class Item < ApplicationRecord

    # アソシエーション
    extend ActiveHash::Associations::ActiveRecordExtensions
    has_many :likes, dependent: :destroy
    has_many :images
    accepts_nested_attributes_for :images, allow_destroy: true
    belongs_to :category, optional: true
    belongs_to :condition
    belongs_to :brand, optional: true
    belongs_to :size, optional: true
    belongs_to :postage
    belongs_to :DeliveryDay, optional: true
    belongs_to_active_hash :prefecture

    # バリデーション
    validates :name,                presence: true
    validates :description,         presence: true
    validates :category_id,         presence: true
    validates :price,               presence: true
    validates :prefecture_id,       presence: true
    validates :postage_id,          presence: true
    validates :condition_id,        presence: true
    validates :delivery_day_id,     presence: true
end
