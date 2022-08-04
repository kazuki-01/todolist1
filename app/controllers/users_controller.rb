class UsersController < ApplicationController

  private
   def user_params
    params_require(:user).parmit(:id, :name, :email, :password, :password_digest)
   end

  def new
    @user = User.new 
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password_digest: params[:password_digest])
    @user.save
    
  end

  def login
  end

  def check
  end

end