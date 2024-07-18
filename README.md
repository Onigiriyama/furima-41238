# users テーブル

| Column       | Type       | Options                   |
| ------------ | ---------- | ------------------------- |
| nickname     | string     | null: false               |
| email        | string     | null: false, unique: true |
| password     | string     | null: false               |
| first_name1  | string     | null: false               |
| last_name1   | string     | null: false               |
| first_name2  | string     | null: false               |
| last_name2   | string     | null: false               |
| birth_day    | date       | null: false               |

### Association
- has_many :items
- has_many :orders

# items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| price               | integer    | null: false                    |
| image               | string     | null: false                    |
| comment             | text       | null: false                    |
| user                | references | null: false, foreign_key: true |
| category            | references | null: false, foreign_key: true |
| condition           | references | null: false, foreign_key: true |
| shipping_payer      | references | null: false, foreign_key: true |
| shipping_area       | references | null: false, foreign_key: true |
| shipping_days       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_payer
- belongs_to :shipping_area
- belongs_to :shipping_days
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

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address_line1| string     | null: false                    |
| address_line2| string     | null: false                    |
| phone_number | string     | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association
- belongs_to :order