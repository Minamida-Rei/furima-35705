# テーブル設計

## usersテーブル
| Column           | Type   | Option      |
| ---------------- | ------ | ----------- |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| last_name        | text   | null: false |
| first_name_kana  | text   | null: false |
| last_name_kana   | text   | null: false |
| birthday         | date   | null: false |

### Association
- has_many :products
- has_one :shipping_address


## productsテーブル
| Column                 | Type       | Option                         |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| status                 | string     | null: false                    |
| explain                | text       | null: false                    |
| delivery_charge        | integer    | null: false                    |
| shipping_area          | string     | null: false                    |
| date_shipment          | integer    | null: false                    |
| value                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association
- has_many :categorys
- has_one :shipping_address


## categorysテーブル
| Column                    | Type       | Option                         |
| ------------------------- | ---------- | ------------------------------ |
| name                      | string     | null: false                    |
| product                   | references | null: false, foreign_key: true |

### Association
- belongs_to :product


## shipping_addresss
| Column                 | Type        | Option                         |
| ---------------------- | ----------- | ------------------------------ |
| postal_code            | string      | null: false                    |
| prefecture             | string      | null: false                    |
| city                   | string      | null: false                    |
| address                | string      | null: false                    |
| phone_number           | integer     | null: false                    |
| user                   | references  | null: false, foreign_key: true |
| product                | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
