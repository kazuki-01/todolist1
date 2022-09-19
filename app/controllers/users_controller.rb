class UsersController < ApplicationController

  before_action :already_login?, only: [:new, :create]

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

  def check
    @user = User.new(name: params[:お名前], email: params[:メールアドレス], password: params[:パスワード])

  end

  def show
  end



  def edit
    @user = current_user
  end



  def update
    @user = current_user
    if @user.update(name: params[:お名前], email: params[:メールアドレス], password: params[:パスワード])
       redirect_to user_path, notice: "ユーザー情報を編集しました"
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end



  def destroy
    logger.debug("qqqqqqqq")
    session[:user_id] = nil
    redirect_to login_path, notice: "ログアウトしました。" 
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end