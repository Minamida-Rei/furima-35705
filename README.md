# テーブル設計

## usersテーブル
| Column                     | Type   | Option                    |
| -------------------------- | ------ | ------------------------- |
| nickname                   | string | null: false               |
| email                      | string | null: false, unique: true |
| encrypted_password         | string | null: false               |
| first_name                 | string | null: false               |
| last_name                  | string | null: false               |
| first_name_kana            | string | null: false               |
| last_name_kana             | string | null: false               |
| birthday                   | date   | null: false               |

### Association
- has_many :products
- has_many :orders

## productsテーブル
| Column                    | Type       | Option                         |
| ------------------------- | ---------- | ------------------------------ |
| name                      | string     | null: false                    |
| status_id                 | integer    | null: false                    |
| explain                   | text       | null: false                    |
| delivery_charge_id        | integer    | null: false                    |
| prefecture_id             | integer    | null: false                    |
| date_shipment_id          | integer    | null: false                    |
| value                     | integer    | null: false                    |
| user                      | references | null: false, foreign_key: true |
| category_id               | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :order

## shipping_addressesテーブル
| Column                 | Type        | Option                         |
| ---------------------- | ----------- | ------------------------------ |
| postal_code            | string      | null: false                    |
| prefecture_id          | integer     | null: false                    |
| city                   | string      | null: false                    |
| address                | string      | null: false                    |
| phone_number           | string      | null: false                    |
| building_name          | string      |                                |
| order                  | references  | null: false, foreign_key: true |

### Association
- belongs_to :order

## ordersテーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| product          | references | null: false, foreign_key: true |

### Association
- has_one :shipping_address
- belongs_to :user
- belongs_to :product