# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name               | string | null: false |
| name_kana          | string | null: false |
| bathday            | date   | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column       | Type    | Options     |
| ------       | ------  | ----------- |
| name         | string  | null: false |
| image        | string  | null: false |
| description  | text    | null: false |
| category     | integer | null: false |
| quality      | integer | null: false |
| postage      | integer | null: false |
| area         | integer | null: false |
| shipping_days| integer | null: false |
| price        | integer | null: false |
| user_id      | references |null: false, foreign_key: true|

### Association

- has_many :comments
- belongs_to :user
- has_one :buy



## comments テーブル

| Column          | Type       | Options                       |
| ------          | -----------| --------------------------    |
| comment_text    | text       | null: false                   |
| item_id         | references | null: false, foreign_key: true|
| user_id         | references | null: false, foreign_key: true|

### Association

- belongs_to :item
- belongs_to :user

## buy テーブル

| Column          | Type   | Options     |
| ---        ---- | -------|------------ |
| credit_card     | string | null: false |
| expiation_date  | string | null: false |
| security_code   | string | null: false |
| post_code       | string | null: false |
| prefectures     | integer| null: false |
| cities          | string | null: false |
| house_number    | string | null: false |
| building        | string | null: false |
| tell            | string | null: false |

### Association

- belongs_to :item