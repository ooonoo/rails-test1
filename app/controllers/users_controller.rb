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
      email:params[:email],
      password:params[:password], # TODO: パスワードを受け取る処理を追加する
      image_name: "default.jpg"
    )
    
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
      Rails.logger.info "ERROR: 作成に失敗しました"
      Rails.logger.info "ERROR: #{@user.errors.full_messages}"
      # TODO: エラーメッセージを新規ユーザー登録画面に表示させる処理を追加する
    end
  end
  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end

  end

  def login_form

  end

  def login
    @user = User.find_by(email: params[:email],
                         password: params[:password])
    # 入力内容と一致するユーザーを取得し変数@userに代入
    if @user
      session[:user_id] = @user.id
      # user.id = hoge が保持される
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

end
