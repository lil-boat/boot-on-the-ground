class UsersController < ApplicationController

  def new

  end

  def create

  end

  def edit

  end

  def show
    @user = User.find(params[:id])
    @job = Job.where(user_id: params[:id])
  end

  def destroy

  end
end
