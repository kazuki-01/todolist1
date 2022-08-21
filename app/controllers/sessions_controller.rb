class SessionsController < ApplicationController
  before_action :already_login?, except: :destroy
  def new
  end

  def create
    logger.debug("aaaaaaaaaa")
    user = User.find_by_email(params[:email])
    logger.debug("bbbbbbbbbb")
    if user && user.authenticate(params[:password])
      logger.debug("ccccccccc")
      session[:user_id] = user.id
      logger.debug("ddddddddd")
      redirect_to user_path, notice: "ログインしました。"
    else
      logger.debug("ZZZZZZZZZZ")
      redirect_to login_path, notice: "メールアドレスもしくはパスワードが違います。"

    end
  end

  def destroy
    logger.debug("qqqqqqqq")
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました。" 
  end

end
