class SessionsController < ApplicationController


  def new
  end

  def create
    user = User.find_by(login: params[:login])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      cookies.signed[:secure_user_id] = "secure#{user.id}"
      redirect_to root_url
    else
      flash[:notice] = 'Login Failed'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end
  
end
