class PostsController < ApplicationController
  #before_action :authenticate_user!, except: [:index]  # deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド

def index
  @posts = Post.all.order(:id)

  
  # 投稿順(最新順)にデータを表示させるようにする
end


def new
  
  @post = Post.new
  
end

def create
  logger.debug("cccccc")
  @post = Post.new(title: params[:title])
  @post.user_id = current_user.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
  logger.debug("dddddd")
  if @post.save
    logger.debug("eeeeee")
    redirect_to posts_path, notice: "リストを追加しました。"
  else
    render :new, notice: "リストを追加できませんでした。", status: :unprocessable_entity
  end
end


def show
  @post = Post.find_by(id: params[:id])
  if @post.nil?
    redirect_to action: :index
  end
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])
  if @post.update(title: params[:title])
    redirect_to posts_path, notice: "ユーザー情報を編集しました"
  else
    flash.now[:alert] = #動作していない・・・・
    logger.debug("aaaaa")
    redirect_to edit_post_url, notice: "編集に失敗しました"
    logger.debug("bbbbbb")
  end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy
  
  redirect_to post_path, notice: "投稿を削除しました"
  
end


private
  def posts_params
    params.require(:post).permit(:title)
  end



end