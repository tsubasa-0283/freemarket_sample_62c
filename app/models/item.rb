class Item < ApplicationRecord

    # アソシエーション
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true
    belongs_to :seller, class_name: 'User', foreign_key: 'seller_id', optional: true
    has_many :likes, dependent: :destroy
    has_many :images
    accepts_nested_attributes_for :images, allow_destroy: true
    belongs_to :category, optional: true
    belongs_to :address, optional: true
    belongs_to :condition, optional: true
    belongs_to :brand, optional: true
    accepts_nested_attributes_for :brand
    belongs_to :size, optional: true
    belongs_to :postage, optional: true
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
