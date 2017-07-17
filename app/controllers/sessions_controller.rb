class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      login(@user)
    else
      @errors = ["Incorrect email or password"]
      render 'new'
    end 
  end

  def destroy
    logout
    redirect_to root_path
  end
end
