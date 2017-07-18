class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @job = Job.where(user_id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :testimonial)
  end
end


