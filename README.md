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

## usersTabel名

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| nickname         | string     | null: false                    |
| email            | string     | null: false                    |
| password         | string     | null: false                    |
| first_name       | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| family_name      | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| birthday         | date       | null: false                    |

### Association
- has_many :items
- has_many :comments
- has_one :shipping_address
- has_many :purchase_records

## itemsTabel名

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| category        | string     | null: false                    |
| price           | integer    | null: false                    |
| seller          | string     | null: false                    |
| condition       | string     | null: false                    |
| image           | date       | null: false                    |
| item_text       | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_many :comments
- has_one :purchase_records
- has_one :shipping_address

## shipping addressTabel名

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| portal_code     | string     | null: false                    |
| prefectures     | string     | null: false                    |
| address1        | string     | null: false                    |
| address2        | integer    | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to ;items

## commentsTabel名

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| comment_text    | string     | null: false                    |
| item_id         | references | null: false, foreign_key: true |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items


## puechase_recodsTabel名

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| byuyer          | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items