class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      flash[:notice] = 'Create user successfully'
      redirect_to login_url
    else
      flash[:notice] = 'Create user fail'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:login, :password)
  end
  
end
