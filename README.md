# Weight APP
#### appとupがかかっています...

## アプリケーション概要
- 日々、体重を入力することでグラフで日々の体重をひと目で確認できます。
- カレンダー機能により、日々の予定を入力することで確認ができます。
- ツイート機能により、他のユーザーに情報をアウトプットすることが出来ます。
- コメント機能により、他のユーザーにコメントしたり、コメントをもらうことが出来ます。
- お気に入り機能により、お気に入りのツイートを保存することが出来ます。

### URL ※アプリをアップしたら載せます

### テストアカウント

## 利用方法 (このアプリケーションの利用方法を説明しましょう。)

## 目指した課題解決(このアプリケーションを通じて、どのような人の、どのような課題を解決したかったかを書きましょう。)

## 実装要件

### ユーザー機能	
- 新規登録を行い、ログインできるようにする	"・新規登録(nickname、Email、Password)を入力し新規登録を行う
- ログイン(Email、Password)を入力し、ログインできるようにする
### ツイート機能	
- テキストや画像(任意)を投稿できるようにする。
- ログインをしていることが前提。
- テキストは必ず入力、画像と体重、身長は任意で投稿することができる
### カレンダー機能
- タイトルとテキストを入力し保存することができる
- ログインをしていることが前提。
- タイトルとテキストは必ず入力し、タイトルのみカレンダーに表示される。タイトルをクリックしたら、テキストまで見れるようにする
### グラフ機能
- 日々の体重を入力し、グラフを用いて、一目で確認できるようにする
- ログインをしていることが前提
- 日々、体重を入力していることが必要
### コメント機能
- 投稿された、ツイートページの下にコメントが出るようにする
- ログインしていることが前提
- コメントには誰がコメントしたかがわかるようにするために、nicknameを表示させる### お気に入り機能
- ユーザーのマイページにお気に入り一覧を表示させる
- お気に入りは、ツイートのタイトルとnicknameで表示させて、いつでも見れるようにする

### 実装した機能についてのGIFと説明	実装した機能について、それぞれどのような特徴があるのか記述する。

### 実装予定の機能

# ER図
## テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :tweets
- has_many :comments
- has_one  :calendar
- has_one  :weight

## Tweets テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |
| text   | text   | null: false |

### Association

- belongs_to :user
- has_many :comments

## comment テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| tweet   | references | null: false, foreign_key: true |

### Association

- belongs_to :tweet
- belongs_to :user

## blog テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null:false                     |
| content    | text       |                                |
| start_time | datetime   |                                |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## weight テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | float      | null:false                     |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user



## favorite テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| tweet   | references | null: false, foreign_key: true |

### Association

- belongs_to :tweet
- belongs_to :user

![ER図](weight_table.png)

# ページ遷移図
![ER図](weight_up.png)

