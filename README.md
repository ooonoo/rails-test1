# README

## ページ作成
```SHELL
rails generate controller posts index
rails g controller users index
```
### rails g　と省略可
### posts = コントローラ名
### index = アクション名

## マイグレーションファイル作成(データベースに変更を指示)
```SHELL
rails generate　model Post content:text

rails g model User name:string email:string
```
### Post = モデル名 
### 「postsテーブルを作成する場合は単数形で」
###　content = カラム名 
### text,string = データ型

## テーブルの作成
```SHELL
rails db:migrate
```
マイグレーションファイルの内容をデータベースに反映する
postsテーブル作成時に「id」,「create_at」,「updated_at」が自動生成
(作成したのは「content」のみ)
データベースに反映されていないマイグレージョンファイルが存在する状態でページにアクセスするとエラーとなる

## コンソールの起動,終了,インスタンスの作成コマンド
## テーブルからデータを取り出す方法
```SHELL
rails console

post1 = Post.new(content:"Hello world")
post1.save

post = Post.first
post.content

posts = Post.all
Post.all[0].content
posts[0].content
posts[1].content

quit
```
post.saveはpost.rbにより使える

複数の時
```SHELL
 user = User.new(name: "にんじゃわんこ", email: "wanko@prog-8.com")
 user.save
```


## 共通のレイアウトをまとめる
views/layouts/application.html.erbに共通事項はまとめる
<header><head><body>タグなどでまとめて記載

## link_toメソッド
```SHELL
<a href="/">TweetApp</a>
<%= link_to("TweetApp","/") %>
```
第一引数にはlinkのテキスト　"TweetApp"
第二引数にはパスやURL "/"

## find_byメソッド
```SHELL
rails console
post = Post.find_by(id:3)
post.content
→ "Rails勉強中"
```

## URLにidを含める
```SHELL
# routes.rb
get "posts/:id" => "posts#show"
# post_controller.rb
def show
end
```

## 繰り返し処理
###　記載内容
```SHELL
<% posts= [
    "肉"
    "野菜"
    "魚"
]
%>
<% posts.each do |post| %>
<%= post %>
<% end %>
```
### 結果
```SHELL
　　肉 野菜 魚
```

##　入力フォーム
```SHELL
<textarea></textarea>
<input type="submit" value="投稿">
```

## form_tagメソッド
```SHELL
<%= form_tag("/post/create")do %>
<textarea></textarea>
<input type="submit" value="投稿">
<% end %>
```
フォームに入力された内容を("/post/create")に送信

## テーブル更新
```SHELL
post = Post.find_by(id:1)
post.content = "Rails"
post.save
```

## テーブル削除
```SHELL
post = Post.find_by(id:1)
post.destroy
```

## progateとの違い
```SHELL
{method: "post"}
# ↓
data: { "turbo-method": :post }
```
POSTメソッドの記述を変えればエラーがでなくなった
リンクのデフォルトのHTTPメソッドはGETだかららしい


## バリデーションの書き方
model/post.rb
```SHELL
class Post < applicationRecord
  validates :content, {presence: true}
  # 空の場合エラー
  validates :content, {presence: true,length:{maximum:140}}
  # 140文字以上でエラーも追加
  # validates :検証するカラム名, {検証する内容}
  validates :email, {uniqueness: true}
  #　重複するものがあればエラー
end
```

## サクセスメッセージ　ページ上に１度だけメッセージ表示　変数flash
### アクション
```SHELL
flash[:notice] = "表示したい文字列"
```
###
```SHELL
<% if flash[:notice] %>
 <div class="flash">
  <%= flash[:notice] %>
  </div>
<% end %>
```

## エラーメッセージ箇所のメモ
```SHELL
          <% @post.errors.full_messages.each do |message| %>
            <div class="form-error">
              <%= message %>
            </div>
          <% end %>
```

## loginアクションのルーティング
```SHELL
<%= link_to("ログイン","/login") %>
# →get "login" => "users#login_form"
# link_toはデフォルトでgetを探す
<%= form_tag("/login") do %>
<% end %>
# →post "login" => "users#login"
# form_tagはデフォルトでpostを探す
```