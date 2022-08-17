class User < ApplicationRecord
  has_secure_password #password_dijest(パスワードのハッシュ化)

  validates :name, presence: true
  validates :email, presence: true ,uniqueness: true    #被らない
  validates :password_digest, presence: true,       #空白は許可しない
                       length: {minimum: 6} , on: :create #最低６文字必要とする



end
