class UsersController < ApplicationController
  def index
    @users = User.all
    # データベースからユーザーデータ全件取得
  end
  def show
    @user = User.find_by(id: params[:id])
  end
end
