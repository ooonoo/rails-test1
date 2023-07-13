class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id:params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content:params[:content])
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end

  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    # URLのidから投稿データを取得する
    @post.content = params[:content]
    # 取得した投稿データのcontentを上書き
    if @post.save
    # 上書きした投稿データを保存する
      flash[:notice] = "投稿を編集しました"
      redirect_to ("/posts/index")
    # 成功したら投稿一覧画面に戻る
    else
      render ("posts/edit")
    # 失敗したら編集画面に戻る
    # 失敗時の入力を残す
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    # URLのidから投稿データを取得する
    @post.destroy
    # 投稿を削除する
    flash[:notice] = "投稿を削除しました"
    redirect_to ("/posts/index")
  end
end