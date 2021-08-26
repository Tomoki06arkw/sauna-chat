# SAUNA-CHAT
このアプリケーションは大阪限定のサウナ情報交流サイトになります。
## ボッチサウナーの情報交換サイト
私はサウナ大好きボッチサウナーです。  
一人で訪れ、ひっそりと帰るのですが本音は知り合いをたくさん作りたい。  
また、たくさんの大阪のサウナ情報を知りたい。  
そんな思いを持っているボッチサウナーは多いと思います。  
そこでそのような問題を解決したいと思い  
気軽にサウナ情報を交換できるアプリケーションを作りました。

### URL	
https://sauna-chat.herokuapp.com/

### テスト用アカウント
BASIC認証 ：tomoki  
PASSWORD : 0616  
ログイン:  
ゲストログイン機能を作りましたのでそちらからログインをお願い致します。

## 目指した課題解決	
サウナの素晴らしさに気がついてほしい。サウナを若者のトレンドにしたい。
飲み会も楽しくて良いですが、サウナに行き自分自身としっかりと向き合い、いい仕事ができる身体やメンタルを整えるのにサウナは最適です。  
私自身、メンタルを失調していた時期にサウナに救われました。  
そこでボッチサウナーの私が大阪の色々なサウナを情報を知りたい、教えたい。  
またボッチサウナー同士で交流したいという思いからこのアプリケーションを作りました。  
誰でも気軽に投稿し、コメントを残し情報を交換する。  
そんなゆるいサウナ情報交換サイトです。

## 利用方法	
新規登録無しで投稿者の情報、投稿内容やチャットにコメントを投稿することが出来ます。  
チャット機能ば非同期でコメントをすることができます。  
新規登録またはゲストログインするとサウナ情報を投稿可能です。  
また、ログインユーザーのみ投稿ページにコメントといいねボタンを押すことが出来ます。

## 工夫したポイント
・モバイルファーストでの実装  
サイトの閲覧はモバイル端末が圧倒的に多いという点からモバイルファーストでの実装を行いました。  
端末からでもビュー崩れがほとんど無い実装をすることができています。

・Javascriptでの実装  
今回はJavascriptの基本的なことを実装するということが私の課題でしたのでトップページに8つほど実装しました。
（詳細はDEMOをご参照下さい。）

・ActionCableを使った非同期通信チャット
Slackをイメージし実装を行いました。改善の余地はありますが本番環境でも問題なく実装できています。

・著書「達人プログラマ」の中で提唱されていた原則DRYを意識したコード  
ビルの割れた窓ガラスを放置しておくと、さらにそのビルは荒廃し、さらにその周辺も荒廃が広がっていくという「割れ窓理論」があります。  
ソフトウェアもこれに当てはまるのでキレイなコードを意識した実装を行いました。  

## 課題や今後実装したい機能
今後実装予定の機能は以下の3点です。  
・gem 'kaminari'を使いページングを実装しましたが、  
ページを遷移するとトップページに戻ってしまうことがストレスに感じるので  
Ajax非同期通信にする。
（実装は完了したが、ページを変更するともっと見るボタンが固まってしまったので完全ではない。remote: trueにしたことによってturbolinkが発動したことによりJSが動作しなくなったと仮説を立てている。）

・いいねでの評価機能  
非同期ではないいいね機能を実装しましたが  
クリックするごとにトップページに遷移するので  
非同期通信でのいいね実装に変更します。  

・サウナ商品購入ページ。  
サウナーならではの素敵な商品があるので皆様に知って戴きたい。
興味があるなら購入してほしいという思いで実装します。

今回の実装課題  
・モバイルファーストで実装したのでウェブサイトで見ると少し寂しく物足りないものになってしまいました。  
モバイルの画面サイズはPCのデスクトップのサイズに比べて圧倒的に小さく、たくさんの情報を載せることできないことに気がつきました。  
そこでmainとsideの二つのカラムを用意し、ウェブサイトではdisplay:flexにし、モバイルではdisplay:none;にする構成にすればPCでもたくさんの情報を載せることができ、モバイルでも多少縦長になるものの、PCとほぼ同じ情報量で掲載できることに気がつきました。  
これを今回の反省とし、次回の実装に活かしていきます。

## 機能一覧
非同期チャット機能
・ActionCableを用いてSlackのようなチャット機能。

非同期通信ページ遷移機能。
・リロードすること無くページを遷移することができる。

画像投稿機能
・アクティブストレージを使って画像表示。

いいね機能
・いいねを使い投稿を評価する。

検索機能
・サウナ名を検索すると結果を表示できる。

ゲストログイン機能
・新規登録なし機能一覧を試しに使用できる。

AWSのS3  
・投稿した画像を表示し続けるためにシンプルストレージサービスを利用。

モバイルファースト
・モバイルの使い勝手の良さ。

アクティブハッシュ
・新規投稿する際に価格、場所を選択式にした。

## トップページのJSの詳細動画  
モバイルファースト  
iPhone 5/SEでもビュー崩れなく実装。  
![demo](https://gyazo.com/22f60fbe2e3e1e8d621cfa51c4b29460/raw)  
  
  
ページング非同期通信  
リロードすること無くページを遷移できるように実装。  
![demo](https://gyazo.com/ce9d240725fc8b6561d112a2eacd0974/raw)  
  
  
非同期チャット  
スラックをイメージし非同期チャットを実装。  
![demo](https://gyazo.com/7c8419201f7efa1871e92f4d953fa008/raw)  
  
  
JS実装  
フェードイン・フェードアウトを利用し実装。  
  ![demo](https://gyazo.com/09ddfe5d0ecba5ee0bd86381c849e06f/raw)  
  
  
JS実装  
ビューをスッキリするためにアコーディオンを実装。  
![demo](https://gyazo.com/79feada27735aa1ab075041975e3ccfe/raw)  
  
  
JS実装  
Slickとmodalを使った実装。  
![demo](https://gyazo.com/9a84e20729e542eb95ed6a7cde7e35ef/raw)   
  
  
  
# データベース設計	

## users テーブル

| Column         |  Type   | Options     |
| ---------------| ------- | ----------- |
| name           | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| nickname       | string  | null: false |
| profile        | text    | null: false |
| experience_id  | integer | null: false |
| profile_image  | string  | ----------- |

### Association

- has_many :chats
- has_many :comments, dependent: :destroy
- has_many :likes,    dependent: : destroy
- belongs_to :experience

## chats テーブル

| Column               | Type        | Options     |
| -------------------- | ----------- | ----------- |
| image                | active      | null: false |
| area_id              | integer     | null: false |
| price_id             | integer     | null: false |
| sauna-name           | string      | null: false |
| description          | text        | null: false |
| user                 | references  | null: false, foreign_key: true |
| sauna_temperature_id | integer     | null: false |
| water_bath_id        | integer     | null: false |


### Association

- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :likes,    dependent: :destroy
- has_one_attached,   :image
- belongs_to :area
- belongs_to :price
- belongs_to :sauna_temperature
- belongs_to :water_bath

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

## likes テーブル

| Column       | Type        | Options     |
| ------------ | ----------- | ----------- |
| user_id      | integer     | ----------- |
| chat_id      | integer     | ----------- |

### Association

- belongs_to :users
- belongs_to :chats