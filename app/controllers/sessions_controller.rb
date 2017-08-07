class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect_to :products, notice: "Signed in"
    else
      redirect_to '/login', notice: "Sign in failed"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: "Logged out"
  end
end
