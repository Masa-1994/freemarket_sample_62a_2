# Mercari DB設計
## usersテーブル
|Column          |Type   |Options                            |
|----------------|-------|-----------------------------------|
|nickname        |string |null: false                        |
|email           |string |null: false, unique: true          |
|password        |string |null: false                        |
|family_name     |string |null: false                        |
|first_name      |string |null: false                        |
|family_name_kana|string |null: false                        |
|first_name_kana |string |null: false                        |
|birthday_year   |date   |null: false                        |
|phone_number    |string |null: false,limit: 11, unique: true|
|introduce       |text   |                                   |
### Association
- has_one  :address
- has_one  :credit_card
- has_many :products
- has_many :comments, dependent: :destroy
- has_many :nices, dependent: :destroy
- has_many :evaluations, dependent: :destroy

## addressesテーブル
|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|user_id       |references|null: false, foreign_key: true|
|postal_code   |integer   |null: false                   |
|prefectures   |string    |null: false                   |
|municipalities|string    |null: false                   |
|house_number  |string    |null: false                   |
|building_name |string    |                              |
|phone_number  |string    |limit: 11                     |
### Association
- belongs_to :user

## credit_cardsテーブル
|Column         |Type      |Options                       |
|---------------|----------|------------------------------|
|user_id        |references|null: false, foreign_key: true|
|card_number    |integer   |null: false                   |
|deadline_month |integer   |null: false                   |
|deadline_year  |integer   |null: false                   |
|security_code  |integer   |null: false                   |
### Association
- belongs_to :user

## productsテーブル
|Column         |Type      |Options                                     |
|---------------|----------|--------------------------------------------|
|name           |string    |null: false, add_index                      |
|seller_id      |references|null: false, foreign_key: {to_table: :users}|
|buyer_id       |references|foreign_key: { to_table: :users }           |
|description    |text      |null: false                                 |
|categories_id  |references|null: false                                 |
|size_id        |references|foreign_key: true                           |
|brand_id       |references|foreign_key: true                           |
|condition      |string    |null: false                                 |
|shipping_charge|string    |null: false                                 |
|shipping_method|string    |null: false                                 |
|shipping_area  |string    |null: false                                 |
|shipping_date  |string    |null: false                                 |
|price          |integer   |null: false                                 |
### Association
- belongs_to :user
- belongs_to :category
- belongs_to :size
- belongs_to :brand
- has_many :comments, dependent: :destroy
- has_many :nices, dependent: :destroy
- has_many :evaluations, dependent: :destroy
- has_many :images, dependent: :destroy

## categoriesテーブル
|Column|Type  |Options    |
|------|------|-----------|
|name  |string|null: false|
### Association
- has_many :products
- has_many :sizes, through: :categories_sizes
- has_many :categories_sizes
- has_many :brands, through: :categories_brands
- has_many :categories_brands

## category_sizesテーブル
|Column     |Type      |Options                       |
|-----------|----------|------------------------------|
|category_id|references|null: false, foreign_key: true|
|size_id    |references|null: false, foreign_key: true|
### Association
- belong_to :category
- belong_to :size

## sizesテーブル
|Column|Type  |Options    |
|------|------|-----------|
|name  |string|null: false|
### Association
- has_many :products
- has_many :categories, through: :categories_sizes
- has_many :categories_sizes

## category_brandsテーブル
|Column     |Type      |Options                       |
|-----------|----------|------------------------------|
|category_id|references|null: false, foreign_key: true|
|brand_id   |references|null: false, foreign_key: true|
### Association
- belong_to :category
- belong_to :brand

## brandsテーブル
|Column|Type  |Options    |
|------|------|-----------|
|name  |string|           |
### Association
- has_many :products
- has_many :categories, through: :categories_brands
- has_many :categories_brands

## commentsテーブル
|Column    |Type      |Options                       |
|----------|----------|------------------------------|
|user_id   |references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|comment   |text      |null: false                   |
### Association
- belong_to :user
- belong_to :product

## nicesテーブル
|Column    |Type      |Options                       |
|----------|----------|------------------------------|
|user_id   |references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belong_to :user
- belong_to :product

## evaluationsテーブル
|Column    |Type      |Options                       |
|----------|----------|------------------------------|
|user_id   |references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belong_to :user
- belong_to :product

## imagesテーブル
|Column    |Type      |Options                       |
|----------|----------|------------------------------|
|product_id|references|null: false, foreign_key: true|
|image     |string    |null: false                   |
### Association
- belong_to :product 