class UsersController < ApplicationController
  def index
    @users = User.all
    # データベースからユーザーデータ全件取得
  end
end
