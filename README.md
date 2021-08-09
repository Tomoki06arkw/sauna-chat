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
また、ログインユーザーのみ投稿ページにコメントを残すことが可能です。
このコメントは登録者のみ閲覧、投稿可能です。

## 工夫したポイント
モバイルファーストでの実装を行いましたのでウェブサイトをモバイル端末で閲覧するほうがキレイに実装されています。
今回はJavascriptの基本的なことを実装するということが私の課題でしたのでトップページに５つほど実装しました。
また、ActionCableを使った非同期チャット機能もSlackをイメージし実装しました。


## 目指した課題解決	
サウナの素晴らしさに気がついてほしい。サウナを若者のトレンドにしたい。
飲み会もいいですが、一人でサウナに行って自分自身としっかりと向き合い
いい仕事ができる身体、メンタルづくりにサウナは最適です。
そこでボッチサウナーの私が大阪の色々なサウナを情報を知りたい、教えたい。
またボッチサウナー同士で交流したいという思いからこのアプリケーションを作りました。
誰でも気軽に投稿し、コメントを残し情報を交換する。
そんなゆるいサウナサイトです。

## 課題や今後実装したい機能
今後実装する機能はメール通知機能、いいね機能、日記機能を実装予定です。
課題はモバイルファーストで実装したのでウェブサイトで見ると少し寂しく物足りないものになってしまいました。
モバイルの画面サイズはPCのデスクトップのサイズに比べて圧倒的に小さく、たくさんの情報を載せることできないことに
気がついた。そこでmainとsideのカラムを用意し、ウェブサイトではdisplay:flexにし
モバイルではdisplay:none;にする構成にすればPCでもたくさんの情報を載せることができ、
モバイルでも多少縦長になるものの、PCとほぼ同じ情報量で掲載できることに気がついた。
反省しています。

## 機能一覧
非同期チャット機能
・ActionCableを用いてSlackのようなチャット機能使うことが出来る。
画像投稿機能
・アクティブストレージを使って画像を表示させる。
ゲストログイン機能
・新規登録なし機能一覧を試しに使うことが出来る。
モバイルファースト
・モバイル端末をベースに設計したのでモバイルでも使い勝手が良いものになっている。
アクティブハッシュ
・新規投稿する際に価格、場所を選択式にすることができる。
JavaScript
・今回はJSの基本的な実装をトップページに実装をした。


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
