class UsersController < ApplicationController
before_action :already_login?, only: [:new, :create]  #new,createは。ログインしていたら、アプリケーションコントローラーで指定しているページへ画面遷移する
before_action :login?, only: :show
  def new
    @user = User.new 
  end

  def create
    @user = User.new(name: params[:お名前], email: params[:メールアドレス], password: params[:パスワード])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path, notice: "新規登録が完了しました。"
    else
      logger.debug("aaaaa")
      render :new, status: :unprocessable_entity
      logger.debug("bbbbb")
    end
  end

  def show
  end



  def edit
  end



  def update
    if current_user.update(user_params)
     redirect_to root_path
    else
    render :edit
    end
  end



  def destroy
    logger.debug("qqqqqqqq")
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました。" 
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end