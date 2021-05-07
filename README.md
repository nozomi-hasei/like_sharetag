#テーブル設計

## users　テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| name               | string | null:false              |
| name_kana          | string | null:false              |
| nickname           | string | null:false              |
| email              | string | null:false, unique:true |
| encrypted_password | string | null:false              |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages
- has_many :tag_user_relation
- has_many :tags, through: tag_user_relation

## tags　テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| like_tags          | string | null:false              |

### Association

- has_many :tag_user_relation
- has_many :users, through: tag_user_relation

## tag_users_relation　テーブル

| Column             | Type       | Options                                    |
| ------------------ | ---------- | -------------------------------------------|
| user               | references | null:false, foreign_key: true              |
| tag                | references | null:false, foreign_key: true              |

### Association

- belongs_to :user
- belongs_to :tag


## rooms　テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| project_title      | string | null:false              |
| memo               | string | null:false              |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## messages　テーブル

| Column              | Type       | Options                                   |
| ------------------- | ---------- | ------------------------------------------|
| content             | string     | null:false                                |
| user                | references | null:false, foreign_key:true              |
| room                | references | null:false, foreign_key:true              |

### Association

- belongs_to :room
- belongs_to :user

## room_users　テーブル

| Column                      | Type       | Options                                   |
| --------------------------- | ---------- | ------------------------------------------|
| user                        | references | null:false, foreign_key:true              |
| room                        | references | null:false, foreign_key:true              |

### Association

- belongs_to :user
- belongs_to :room