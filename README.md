# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Note

# テーブル設計

## usersテーブル
|Column                    |Type          |Options                        |
|--------------------------|--------------|-------------------------------|
|nickname                  |string        |null: false                    |
|encrypted_password        |string        |null: false                    |
|email                     |string        |null: false                    |
|birthday                  |date          |null: false                    |
|kana_first_name           |string        |null: false                    |
|kana_family_name          |string        |null: false                    |
|kanji_first_name          |string        |null: false                    |
|kanji_family_name         |string        |null: false                    |
 
### Association

- has_many :products
- has_many :purchase_histories

## productsテーブル
|Column                    |Type          |Options                        |
|--------------------------|--------------|-------------------------------|
|name                      |string        |null: false                    |
|text                      |text          |null: false                    |
|price                     |integer       |null: false                    |
|category_id               |string        |null: false                    |
|state_id                  |integer       |null: false                    |
|delivery_fee_burden_id    |integer       |null: false                    |
|shipment_source_id        |integer       |null: false                    |
|day_to_ship_id            |integer       |null: false                    |
|user                      |references    |null: false, foreign_key: true |

### Association

- has_one    :purchase_history
- belongs_to :user

## purchase_historiesテーブル

|Column                    |Type          |Options                        |
|--------------------------|--------------|-------------------------------|
|product                   |references    |null: false, foreign_key: true |
|user                      |references    |null: false, foreign_key: true |

### Association
- has_one    :buyer_information
- belongs_to :product
- belongs_to :user

## buyer_informationテーブル
|Column                    |Type          |Options                        |
|--------------------------|--------------|-------------------------------|
|postal_code               |string        |null: false                    |
|prefecture_id             |integer       |null: false                    |
|city_name                 |string        |null: false                    |
|address                   |string        |null: false                    |
|building_name             |string        |                               |
|phone_number              |string        |null: false                    |
|purchase_history          |references    |null: false, foreign_key: true |

### Association
- belongs_to :purchase_history

# Author
堀内 健矢