class UsersController < ApplicationController
  def index
    @users = User.all
    # データベースからユーザーデータ全件取得
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name:params[:name],
      email:params[:email]
    )
    
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end
end
