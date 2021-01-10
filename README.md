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

## userテーブル
|Column                    |Type          |Options                |
|--------------------------|--------------|-----------------------|
|nick_name                 |string        |null: false            |
|password                  |string        |null: false            |
|email_address             |string        |null: false            |
|birth_year                |integer       |null: false            |
|birth_month               |integer       |null: false            |
|birth_day                 |integer       |null: false            |
|kana_first_name           |string        |null: false            |
|kana_family_name          |string        |null: false            |
|kanji_first_name          |string        |null: false            |
|kanji_family_name         |string        |null: false            |

### Association

- has_many :product
- has_many :buyer

## productテーブル
|Column                    |Type          |Options                |
|--------------------------|--------------|-----------------------|
|item_name                 |string        |null: false            |
|item_text                 |text          |null: false            |
|price                     |integer       |null: false            |
|item_category             |string        |null: false            |
|item_state                |string        |null: false            |
|delivery_fee_burden       |string        |null: false            |
|shipment_source           |string        |null: false            |
|day_to_ship               |integer       |null: false            |

### Association

- has_one    :buyer
- belongs_to :user

## buyerテーブル
|Column                    |Type          |Options                |
|--------------------------|--------------|-----------------------|
|postal_code               |integer       |null: false            |
|prefecture                |string        |null: false            |
|city_name                 |string        |null: false            |
|address                   |string        |null: false            |
|building_name             |string        |null: false            |
|room_number               |string        |                       |
|phone_number              |integer       |null: false            |

### Association
- belongs_to :user
- belongs_to :product

# Author
堀内 健矢