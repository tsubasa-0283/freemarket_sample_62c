class Address < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

    kanji = /\A[一-龥]+\z/
    kana = /\A([ァ-ン]|ー)+\z/
    post_number = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/

    belongs_to :user, optional: true
    belongs_to_active_hash :prefecture
    has_many   :items, optional: true
end
