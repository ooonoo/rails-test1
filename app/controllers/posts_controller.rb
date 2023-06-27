class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  def show
    @post = Post.find_by(id:params[:id])
  end
  def new
  end
  def create
    @post = Post.new(content:params[:content])
    @post.save
    redirect_to ("/posts/index")
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
      redirect_to ("/posts/index")
    # 成功したら投稿一覧画面に戻る
    else
      redirect_to ("/posts/#{@post.id}/edit")
    # 失敗したら編集画面に戻る
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    # URLのidから投稿データを取得する
    @post.destroy
    # 投稿を削除する
    redirect_to ("/posts/index")
  end
end