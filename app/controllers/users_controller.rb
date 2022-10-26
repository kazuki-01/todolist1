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
      
      
      redirect_to edit_user_path, alert: "編集に失敗しました"
    end
  end



  def destroy
    logger.debug("ssssaaaaa")
    @user = current_user
    logger.debug("dddddddd")
    @user.destroy
    logger.debug("aaaaa")
    session[:user_id] = nil
    redirect_to login_path method: :get, notice: "ユーザーを削除しました。" 
  end

  def withdrawal
    @opinion = Opinion.new
  end

  def withdrawal_cerate
    @opinion = Opinion.new(cause: params[:cause], opinion: params[:opinion])
    @opinion.save
    render destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end