class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable

  #validation定義
  kanji = /\A[一-龥]+\z/
  kana = /\A([ぁ-ん]|ー)+\z/
  year_month_day = /\A\d{4}-\d{2}-\d{2}\z/
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  phone_number = /\A[0-9]+\z/

  # バリデーション

  #step1
  validates :nickname,                presence: true, length: {maximum: 20}, on: :save_step1_to_session
  validates :email,                   presence: true, uniqueness: true, format: {with: VALID_EMAIL}, on: :save_step1_to_session
  validates :password,                presence: true, length: {minimum: 6, maximum: 128}, on: :save_step1_to_session
  validates :last_name,               presence: true, format: { with: kanji }, on: :save_step1_to_session
  validates :first_name,              presence: true, format: { with: kanji }, on: :save_step1_to_session
  validates :last_name_kana,          presence: true, format: { with: kana },  on: :save_step1_to_session
  validates :first_name_kana,         presence: true, format: { with: kana }, on: :save_step1_to_session
  validates :birth_year,           presence: true, on: :save_step1_to_session
  validates :birth_month,          presence: true, on: :save_step1_to_session
  validates :birth_day,            presence: true, on: :save_step1_to_session

  #STEP2
  validates :tel,                     presence: true, on: :save_step2_to_session

  has_one   :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many  :items

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
