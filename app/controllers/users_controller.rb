class UsersController < ApplicationController

  private
   def user_params
    params_require(:user).parmit(:id, :name, :email, :password, :password_digest)
   end

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end

  end

  def login
  end

  def check
  end



end