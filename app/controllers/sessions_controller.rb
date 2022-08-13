class SessionsController < ApplicationController
  def new
  end

  def creare
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path, notice: "ログインしました。"
    else
      flash.now[:alert] = "メールアドレスもしくは、パスワードが違います。"
      render :new
    end
  end

  def destroy
    session[:user.id] = nil
    redirect_to root_path, notice: "ログアウトしました。"
  end

end
