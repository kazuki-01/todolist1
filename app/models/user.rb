class User < ApplicationRecord
  has_secure_password #password_dijest(パスワードのハッシュ化)

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true,       #空白は許可しない
                       length: {minimum: 6}  #最低６文字必要とする



end
