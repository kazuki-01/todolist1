class ApplicationController < ActionController::Base

# deviseのコントローラを使う前に呼ばれるアクション
before_action :configure_permitted_parameters, if: :devise_controller?

private


#permitは、ストロングパラメーター
def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :email, :password_digest])
  devise_parameter_sanitizer.permit(:sign_in, keys:[:email, :password_digest])
  devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password_digest]) #カラムを追加した分のみ、メールとアップデートはデフォルトで入っていた為すでになっている
  
end

end
