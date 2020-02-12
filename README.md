# freemarket_sample_62c

フリマアプリ「メルカリ」のクローンサイト

# Description

フリマアプリ「メルカリ」のクローンサイトです。

商品購入、商品の出品をすることができて、
ユーザー登録家の中にある無駄に感じている物を
簡単に売ることができますし、安く購入することができます。

# Features
・ユーザー登録フォーム
・ユーザーログイン、ログアウト
・ユーザー編集
・マイページの表示機能
・商品出品、編集、削除
・商品ステータス機能
・pay.jpによる決済処理
・商品購入機能

* Dependency
| 種別         | 名称                         |
| 開発言語       | Ruby(ver 2.5.2)            |
| フレームワーク    | Ruby on Rails(ver 5.0.7.2) |
| マークアップ     | HTML(Haml),CSS(Saas)       |
| フロントエンド    | Javascript(jQuery)         |
| DB         | MYSQL                      |
| 本番環境       | AWS EC2                    |
| 画像アップロード   | carrierwave, AWS S3        |
| 自動デプロイ     | capistrano                 |
| ユーザー管理     | devise                     |
| クレジットカード管理 | payJP                      |

## ER図
https://cacoo.com/diagrams/BHYHOxPmYMvwW9ar/B1D77

## usersテーブル

| Column          | Type    | Options                             |
| --------------- | ------- | ----------------------------------- |
| nickname        | string  | null: false,limit: 20               |
| email           | string  | null: false, unique: true           |
| password        | strinfg | null: false, unique: true           |
| first_name      | string  | null: false, limit: 30              |
| last_name       | string  | null: false, limit: 30              |
| first_name_kana | string  | null: false, limit: 30              |
| last_name_kana  | string  | null: false, limit: 30              |
| birth_year      | integer |                                     |
| birth_month     | integer |                                     |
| birth_day       | integer |                                     |
| tel             | integer | null false, limit: 30, unique: true |
| post_number     | integer | null: false                         |
| prefecture      | string  | null: false                         |
| city            | string  | null: false                         |
| address         | string  | null: false                         |
| city            | string  | null: false                         |
| address         | string  | null: false                         |
| building        | string  |                                     |
| tel             | integer |                                     |

### Association
- has_many :item_comments
- has_many :sns_credentials, dependent: :destory
- has_many :items, dependent: :destroy
- has_many :transactions, dependent: :destroy
- has_many :likes
- has_one  :addresses
- has_one  :credit_cards


## addressesテーブル

| Column      | Type    | Options                         |
| ----------- | ------- | ------------------------------- |
| user_id     | integer | null : false, foreign_key: true |
|                 |

### Association
- belongs_to :user


## credit_cardsテーブル

| Column                | Type    | Options                        |
| --------------------- | ------- | ------------------------------ |
| user_id               | integer | null: false, foreign_key: true |
| card_number           | integer | null: false                    |
| expiration_date_month | integer | null: false                    |
| expiration_date_year  | integer | null: false                    |
| sequrity_code         | integer | null: false                    |

### Association
- belongs_to :user


## item_commentsテーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| comment | text    | null: false                    |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foregin_key: true |


### likesテーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## transactionsテーブル

| Column               | Type    | Options                                        |
| -------------------- | ------- | ---------------------------------------------- |
| transaction_state_id | integer | null: false, foreign_key: true                 |
| user_id              | integer | null: false, foreign_key: { to_table: :users } |
|                      |         |                                                |
| item_id              | integer | null: false, foreign_key: true                 |
| buyer_id             | integer | null: false, foreign_key: { to_table: :users } |

### Association
- has_many :users, dependent: :destroy
- belongs_to :item
- belongs_to :transaction_state
- belongs_to :transaciton_state
- belongs_to :buyer, class_name: "User"

## transactions_statesテーブル(マスターテーブル)

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| state  | string | null: false |

### Association
- has_many :transactions



## itemsテーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| description        | text       | null: false                     |
| condition_id       | integer    | null: false                     |
| user_id            | references | null: false, foreign_key: true  |
| postage_id         | integer    | null: false, foreign_key: true  |
| prefecture         | string     | null: false                     |
| delivery_day_id    | integer    | null: false                     |
| price              | integer    | null: false                     |
| brand_id           | integer    | null: false                     |
| likes_count        | integer    | null: false                     |
| category_id        | references | null: false , foreign_key: true |
| item_state_id      | references | null: false , foreign_key: true |

### Association
- has_many :likes, dependent: :destroy
- has_many :transactions, dependent: :destroy
- belongs_to :user
- belongs_to :condition
- has_many :category_items, dependent: :destroy
- has_many :categorys, through: :category_items
- belongs_to :delivery_day
- has_many :images, dependent: :destroy
- belongs_to :brand
- belongs_to :postage
- belongs_to :size
- has_many :item_comments
- belongs_to :item_state


## item_states(マスターテーブル)

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| state  | string | null: false |

## Association
- has_many :items


## conditionsテーブル(マスターテーブル)

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| condition | string | null: false |

### Association
- has_many :items


## category_itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_id     | references | null: false, foreign_key: true |
| category_id | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :category


## categorysテーブル(マスターテーブル)

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| name      | string  | null: false |
| parent_id | integer | null: false |

### Association
- has_many :category_items, dependent: :destroy
- has_many :items, through: :category_items, dependent: :destroy
- belongs_to :size
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :parent_id


## sizesテーブル(マスターテーブル)

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| size    | string     | null: false                    |


### delivery_daysテーブル(マスターテーブル)

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| days   | string | null: false |

### Association
- has_many :items


## imagesテーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| item_id | references | null:false, foreign_key: true |
| image   | string     | null: false                   |

### Associations
- belongs_to :item


## brandsテーブル(マスターテーブル)

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association
- has_many :items
- has_many :categories


## postagesテーブル(マスターテーブル)

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| delivery_charge | string | null: false |

### Association
- has_many :items


<!-- ## delivery_methodsテーブル(マスターテーブル)

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| method | string | null: false |

### Association
- has_many :items -->

