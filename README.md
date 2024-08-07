# users テーブル

| Column              | Type       | Options                   |
| ------------------- | ---------- | ------------------------- |
| nickname            | string     | null: false               |
| email               | string     | null: false, unique: true |
| encrypted_password  | string     | null: false               |
| first_name          | string     | null: false               |
| last_name           | string     | null: false               |
| first_name_kana     | string     | null: false               |
| last_name_kana      | string     | null: false               |
| birth_day           | date       | null: false               |

### Association
- has_many :items
- has_many :orders

# items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| price             | integer    | null: false                    |
| comment           | text       | null: false                    |
| user              | references | null: false, foreign_key: true |
| category_id       | integer    | null: false,                   |
| condition_id      | integer    | null: false,                   |
| shipping_payer_id | integer    | null: false,                   |
| prefecture_id     | integer    | null: false,                   |
| shipping_day_id   | integer    | null: false,                   |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_payer
- belongs_to :shipping_area
- belongs_to :shipping_day
- has_one :order

# orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

# address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false, foreign_key: true |
| city          | string     | null: false                    |
| address_line  | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order