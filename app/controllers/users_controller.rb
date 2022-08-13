class UsersController < ApplicationController
  
  def new
    @user = User.new 
  end

  def create
    if user = User.new(name: params[:お名前], email: params[:メールアドレス], password: params[:パスワード])
      user.save
      session[:user_id] = user.id
      redirect_to user_path, notice: "新規登録が完了しました。"
    else
      render :new, notice: "新規登録できませんでした。"
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end