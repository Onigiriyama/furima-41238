# users テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| Nickname     | string     | null: false       |
| Email        | string     | null: false, unique: true |
| Password     | string     | null: false       |
| First_name1  | string     | null: false       |
| Last_name1   | string     | null: false       |
| First_name2  | string     | null: false       |
| Last_name2   | string     | null: false       |
| Birth_year   | integer    | null: false       |
| Birth_month  | integer    | null: false       |
| Birth_date   | integer    | null: false       |

### Association
- has_many :items
- has_many :orders

# items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| Price        | integer    | null: false                    |
| Image        | string     | null: false                    |
| comment      | text       | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :orders

# orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

# address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| Postal_code  | string     | null: false                    |
| City         | string     | null: false                    |
| address_line1| string     | null: false                    |
| address_line2| string     | null: false                    |
| Phone_number | string     | null: false                    |
| use_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :order