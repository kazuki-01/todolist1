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
      redirect_to action: :new, notice: "メールアドレスもしくはパスワードが違います。"

    end
  end

  def destroy
    logger.debug("aaaa")
    session[:user_id] = nil
    logger.debug("bbbb")
    redirect_to login_path,status:303, method: :get, notice: "ログアウトしました。" 
    logger.debug("cccc")
  end
  
end