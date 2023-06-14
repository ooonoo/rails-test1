# README

## ページ作成
```SHELL
rails generate controller posts index
```
### rails g　と省略可
### posts = コントローラ名
### index = アクション名

## マイグレーションファイル作成(データベースに変更を指示)
```SHELL
rails generate　model Post content:text
```
### Post 「postsテーブルを作成する場合は単数形で」
###　content = カラム名 
### text = データ型

## テーブルの作成
```SHELL
rails db:migrate
```
マイグレーションファイルの内容をデータベースに反映する
postsテーブル作成時に「id」,「create_at」,「updated_at」が自動生成
(作成したのは「content」のみ)
データベースに反映されていないマイグレージョンファイルが存在する状態でページにアクセスするとエラーとなる

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