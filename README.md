# SAUNA-CHAT
このアプリケーションは大阪のサウナ情報交換サイトになります。
## ボッチサウナーの情報交換サイト
私はサウナが大好きですが、いつもボッチサウナーです。
一人でひっそりと訪れ、帰るのですが本音は知り合いをたくさん作りたい。
また、たくさんのサウナ情報を得たい。そんなボッチサウナーの思いを解消するべくこのアプリケーションを作りました。

### URL	
https://sauna-chat.herokuapp.com/

### テスト用アカウント	
ログイン
ゲストログイン機能を作りましたのでそちらからログインして下さい。

## 利用方法	
新規登録無しでも投稿者の情報を閲覧可能です。またゲストチャット機能を実装したので非同期でコメントをすることができます。
新規登録またはゲストログインするとサウナ情報を投稿可能です。
またユーザー投稿ページにコメントを残すことが可能です。
このコメントは登録者のみ閲覧、投稿可能です。

## 工夫したポイント
モバイルファーストでの実装を行いましたのでウェブサイトをモバイル端末で閲覧するほうがキレイに実装されている。
Javascriptでの実装を中心に行なったのでトップページはいくつか工夫が凝らされています。
また、ActionCableを使った非同期チャット機能もSlackをイメージし実装しました。

## 目指した課題解決	
サウナの素晴らしさに気がついてほしい。またボッチサウナー同士で交流したいという思いからこのアプリケーションを作りました。
誰でも気軽に投稿し、コメントを残しいて

## 課題や今後実装したい機能
セミトップページにログイン機能を実装したことにより閲覧するのに少し手間がかかってしまいます。
解決するためにログイン画面にテスト用アカウントを記載しました。
メール自動返信機能を実装中です。
不安や怒りや悲しみというのは一時の感情によるもので
後々見返してみると大したことなかったり笑えるものになっていることが多いです。
そこで見返す事のできる機能をつけることで次に書くときに少し冷静に自分自身と向き合うことができる
そんなシステムを作りたいと思い実装しています。

## 洗い出した要件	
ウィザード式ログイン機能
・目的→どのページでどの情報を書いているかを確認しやすくするため。
日記投稿機能
・自身で書かれた日記を保存することが出来る
カレンダー機能
・日記を日付ごとに管理することが出来る。
音楽機能
・日記を書いている時にリラックスしながら音楽を聴くことができる。

# トップページとライティングページの詳細動画,画像
トップページ ![demo](https://gyazo.com/0b473ad54c03844774b049714b2e4ee5/raw)

ログイン画面　![2021-07-20 14 52のイメージ](https://user-images.githubusercontent.com/84255600/126270310-45b1f66e-ceb1-4290-9090-2c4f94c4bd8c.jpg)

ライティングページ ![2021-07-20 14 22のイメージ](https://user-images.githubusercontent.com/84255600/126266200-845971b8-d445-41ad-aebd-a39b9fe085f5.jpg)


データベース設計	

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

| Column       | Type        | Options     |
| ------------ | ----------- | ----------- |
| image        | active      | null: false |
| area_id      | integer     | null:false  |
| price        | integer     | null: false |
| sauna-name   | string      | null:false  |
| description  | text        | null: false |
| user         | references  | null:false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column     | Type          ｜Options                        |
| -----------| --------------|--------------------------------|
| text       | text          | null:false                     |
| user       | references    | null: false, foreign_key: true |
| prototype  | references    | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :chats
