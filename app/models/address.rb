class Address < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :shippingday

    kanji = /\A[一-龥]+\z/
    kana = /\A([ァ-ン]|ー)+\z/
    post_number = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/

    belongs_to :user, optional: true
    has_many   :items
    belongs_to_active_hash :prefecture
    
end
