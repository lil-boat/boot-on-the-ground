class JobsController < ApplicationController

  def index
    @users = User.all
    @jobs = Jobs.all
  end

  def new
    @job = Job.new
    
  end

  def create
    
  end

  def edit
     @job = Job.find(params[:id])
    
  end

  def destroy
    
  end
end
