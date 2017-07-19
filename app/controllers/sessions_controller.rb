class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect_to user_path(current_user)
    else
      @errors = ["Incorrect email or password"]
      render 'new'
    end 
  end

  def destroy
    session[:id] = nil
    redirect_to root_path
  end
end
