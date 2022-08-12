class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def new
    @user = User.new 
  end

  def create
    @user = User.new(name: params[:お名前], email: params[:メールアドレス], password_digest: params[:パスワード])
      redirect_to ("/check")
    else
      render :new, status: :unprocessable_entity
    end

  end

  def login
  end

  def check
  end



end