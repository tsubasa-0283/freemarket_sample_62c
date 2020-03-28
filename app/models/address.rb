class Address < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

    kanji = /\A[一-龥]+\z/
    kana = /\A([ァ-ン]|ー)+\z/
    post_number = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/

    belongs_to :user, optional: true
    belongs_to_active_hash :prefecture

    # validates :post_number, precense: true, format: { with: postal }
    # validates :first_name, precense: true, length: { maximum: 15 }, format: { with: kaji }
    # validates :last_name, precense: true, length: { maximum: 15 }, format: { with: kanji }
    # validates :first_name_kana, precense: true, length: { maximum: 15 }, format: { with: kana }
    # validates :last_name_kana, precense: true, length: { maximum: 15}, format: { with: kana }
end
