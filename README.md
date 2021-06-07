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
- has_one :buying

## productsテーブル
| Column                    | Type       | Option                         |
| ------------------------- | ---------- | ------------------------------ |
| name                      | string     | null: false                    |
| status_id                 | string     | null: false                    |
| explain                   | text       | null: false                    |
| delivery_charge_id        | integer    | null: false                    |
| prefecture_id             | integer    | null: false                    |
| date_shipment_id          | integer    | null: false                    |
| value                     | integer    | null: false                    |
| user                      | references | null: false, foreign_key: true |
| category_id               | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :buying

## shipping_addresssテーブル
| Column                 | Type        | Option                         |
| ---------------------- | ----------- | ------------------------------ |
| postal_code            | string      | null: false                    |
| prefecture_id          | integer     | null: false                    |
| city                   | string      | null: false                    |
| address                | string      | null: false                    |
| phone_number           | string      | null: false                    |
| building_name          | string      |                                |

### Association
- has_one :buying

## buyingsテーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false                    |
| product          | references | null: false                    |

### Association
- belongs_to :shipping_address