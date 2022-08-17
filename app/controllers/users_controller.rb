class UsersController < ApplicationController
  
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


  def destroy
    logger.debug("qqqqqqqq")
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました。"
  end

  private
  def user_params
    params.require(:user).permit(:お名前, :メールアドレス, :パスワード, :パスワード（確認）)
  end
end