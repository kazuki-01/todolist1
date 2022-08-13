class ApplicationController < ActionController::Base

# deviseのコントローラを使う前に呼ばれるアクション
before_action :configure_permitted_parameters, if: :devise_controller?

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
