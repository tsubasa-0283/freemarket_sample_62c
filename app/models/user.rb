class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

          kanji = /\A[一-龥]+\z/
          kana = /\A([ァ-ン]|ー)+\z/
          year_month_day = /\A\d{4}-\d{2}-\d{2}\z/
          VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
          phone_number = /\A[0-9]+\z/

  # validates :nickname, presence: true, length: { maximum: 15 }
  # validates :email, presence: true, format: { with: VALID_EMAIL }
  # validates :first_name, presence: true, length: { maximum: 15 }, format: { with: kanji }
  # validates :last_name, presence: true, length: { maximum: 15 }, format: { with: kanji }
  # validates :birthday, presence: true, length: { with: year_month_day }
  # validates :password, presence: true, length: { minimum: 8 }
  # validates :tel, presence: true, format: { with: phone_number }

  has_one   :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many  :items

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
