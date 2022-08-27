class PostsController < ApplicationController
  #before_action :authenticate_user!, except: [:index]  # deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド

def index
  @posts = Post.all

  
  # 投稿順(最新順)にデータを表示させるようにする
end


def new
  logger.debug("aaaaa")
  @post = Post.new
  logger.debug("bbbbbb")
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
  @post = Post.find(params[:id])

end

def edit
end

def update
end

def destroy
end


private
  def posts_params
    params.require(:post).permit(:title)
  end



end