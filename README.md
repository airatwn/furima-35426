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

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false,unique:true        |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| family_name        | string     | null: false                    |
| family_name_kana   | string     | null: false                    |
| birthday           | date       | null: false                    |

### Association
- has_many :items
- has_many :comments
- has_many :purchase_records

## itemsTabel名

| Column              | Type       | Options                        |
| --------------------| ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| category_id         | integer    | null: false                    |
| price               | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| days_to_ship_id     | integer    | null: false                    |
| item_text           | text       | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one :purchase_record

## shipping_addressesTabel名

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| portal_code      | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| address1         | string     | null: false                    |
| address2         | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_record | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_record

## commentsTabel名

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| comment_text    | string     | null: false                    |
| item            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## purchase_recordsTabel名

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address