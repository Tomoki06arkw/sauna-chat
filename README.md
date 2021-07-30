# テーブル設計

## users テーブル

| Column         |  Type   | Options     |
| ---------------| ------ | ----------- |
| name           |  string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| nickname       | string | null: false |
| profile        | text   | null: false |
| experience     | text   | null: false |

### Association

- has_many :chats
- has_many :comments

## chats テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image  | active | null: false |
| area_id| integer| null:false  |
| sauna  | string | null:false  |
| user   | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type          |Options                        |
| --------| ------         |----------------------------- |
| text    | text           | null: false                    |
| user    | references    | null: false, foreign_key: true |
| prototype  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :chats
