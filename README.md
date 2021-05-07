## テーブル設計

## usersテーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| name               | string | null:false              |
| name_kana          | string | null:false              |
| nickname           | string | null:false              |
| email              | string | null:false, unique:true |
| encrypted_password | string | null:false              |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages


## tagsテーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| name               | string | null:false              |

### Association

- has_many :memo_tag_relations
- has_many :memos, through: :memo_tag_relations

## memosテーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| memo               | string | null:false              |

### Association

- has_many :memo_tag_relations
- has_many :tags, through: :memo_tag_relations

## memo_tag_relations　テーブル

| Column             | Type       | Options                                    |
| ------------------ | ---------- | -------------------------------------------|
| memo               | references | null:false, foreign_key: true              |
| tag                | references | null:false, foreign_key: true              |

### Association

- belongs_to :memo
- belongs_to :tag


## rooms　テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| project_title      | string | null:false              |
| memo               | string | null:false              |

### Association

- has_many :room_users
- has_many :users, through: :room_users
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