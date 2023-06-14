# README

## ページ作成
```SHELL
rails generate controller posts index
```
### rails g　と省略可
### posts = コントローラ名
### index アクション名

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