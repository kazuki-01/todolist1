class ApplicationController < ActionController::Base
  helper_method :current_user     #current_user(今ログインしているユーザー)のIDをviewでも使えるようになる
  # deviseのコントローラを使う前に呼ばれるアクション
  before_action :configure_permitted_parameters, if: :devise_controller?


  def current_user
    if session[:user_id]                                       #session　IDが、nilではなかったら、current_userにsession　IDを入れる
        current_user ||= User.find(session[:user_id])
    end
  end

  def login?
    if current_user.nil?
        redirect_to login_path, alert: "ログインしてください。"
    end
  end

  def already_login?
    unless current_user.nil?
        redirect_to user_path, notice: "すでにログインしています。"
    end
  end





  def after_sign_in_path_for(resource)
    home_path
  end

  private

  def after_signup_path_for(resource)
    check_path
  end


  #permitは、ストロングパラメーター
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :email, :password_digest])
    devise_parameter_sanitizer.permit(:sign_in, keys:[:email, :password_digest])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password_digest]) #カラムを追加した分のみ、メールとアップデートはデフォルトで入っていた為すでになっている
    
  end

end
