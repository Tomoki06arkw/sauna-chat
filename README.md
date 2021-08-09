# SAUNA-CHAT
このアプリケーションは大阪限定のサウナ情報交換サイトになります。
## ボッチサウナーの情報交換サイト
私はサウナが大好きですが、いつもボッチサウナーです。<br>
一人でひっそりと訪れ,帰るのですが本音は知り合いをたくさん作りたい。<br>
また、たくさんの大阪サウナ情報を得たい。そんなボッチサウナーの思いを解消するべくこのアプリケーションを作りました。

### URL	
https://sauna-chat.herokuapp.com/

### テスト用アカウント
BASIC認証 ：tomoki
PASSWORD  : 0616
ログイン
ゲストログイン機能を作りましたのでそちらからログインして下さい。

## 利用方法	
新規登録無しでも投稿者の情報を閲覧可能ですしゲストチャット機能を実装したので非同期でコメントをすることができます。
新規登録またはゲストログインするとサウナ情報を投稿可能です。<br>
また、ログインユーザーのみ投稿ページにコメントを残すことが可能です。
このコメントは登録者のみ閲覧、投稿可能です。

## 工夫したポイント
・モバイルファーストでの実装<br>
ウェブサイトの閲覧はモバイル端末が圧倒的に多いという点からモバイルファーストでの実装を行いました。<br>
端末からでもビュー崩れがほとんど無い実装をすることができています。

・Javascriptでの実装
今回はJavascriptの基本的なことを実装するということが私の課題でしたのでトップページに５つほど実装しました。
（詳細はDEMOをご参照下さい。）

・ActionCableを使った非同期通信チャット
Slackをイメージし実装を行いました。改善の余地はありますが本番環境でも問題なく実装できています。

・著書「達人プログラマ」の中で提唱されていた原則DRYを意識したコード。
ビルの割れた窓ガラスを放置しておくと、さらにそのビルは荒廃し、さらにその周辺も荒廃が広がっていくという「割れ窓理論」があります。<br>
ソフトウェアもこれに当てはまるのでキレイなコードを意識した実装を行いました。<br>
しかしながら何が割れているのか何が正しいコードなのか現時点では判断がつかないので
重複部分はないか。まとめて書くことが出来る部分はまとめて書くということを意識し実装しまいした。

## 目指した課題解決	
サウナの素晴らしさに気がついてほしい。サウナを若者のトレンドにしたい。
飲み会も楽しくて良いですが、サウナに行き自分自身としっかりと向き合い
いい仕事ができる身体、メンタルを整えるのにサウナは最適です。<br>
そこでボッチサウナーの私が大阪の色々なサウナを情報を知りたい、教えたい。
またボッチサウナー同士で交流したいという思いからこのアプリケーションを作りました。<br>
誰でも気軽に投稿し、コメントを残し情報を交換する。<br>
そんなゆるいサウナサイトです。

## 課題や今後実装したい機能
今後実装する機能は  
・メール通知機能  
新規登録した際に確認メールが届く仕様にします。ユーザーが登録できているか確認できるようにするためにこの機能を考えました。

・いいね機能  
いいねと評価をして貰えると嬉しいものです。この嬉しさがまた投稿を促してくれます。  
また、その場所の評価値を表す指標にもなるのでこの機能の実装を考えました。

今回の実装課題  
・モバイルファーストで実装したのでウェブサイトで見ると少し寂しく物足りないものになってしまいました。  
モバイルの画面サイズはPCのデスクトップのサイズに比べて圧倒的に小さく、たくさんの情報を載せることできないことに気がつきました。
そこでmainとsideの二つのカラムを用意し、ウェブサイトではdisplay:flexにし、モバイルではdisplay:none;にする構成にすればPCでもたくさんの情報を載せることができ、 モバイルでも多少縦長になるものの、PCとほぼ同じ情報量で掲載できることに気がつきました。
これを今回の反省で次回の実装に活かしていきます。


## 機能一覧
非同期チャット機能
・ActionCableを用いてSlackのようなチャット機能。

画像投稿機能
・アクティブストレージを使って画像表示。

ゲストログイン機能
・新規登録なし機能一覧を試しに使用できる。

モバイルファースト
・モバイルの使い勝手の良さ。
アクティブハッシュ
・新規投稿する際に価格、場所を選択式にした。


# データベース設計	

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

## messages テーブル

| Column       | Type        | Options     |
| ------------ | ----------- | ----------- |
| text         | text        | ----------- |
