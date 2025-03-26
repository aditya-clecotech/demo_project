class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "User logged in successfully"
    else
      render :new , alert: "Invalid email or password, please try again!"
    end
  end

  def destroy
    session[:user_id] = nil 
    redirect_to root_path, notice: "User logged out successfully"
  end

end
