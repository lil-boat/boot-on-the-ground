class JobsController < ApplicationController
before_action :user_is_logged_in
  def index
    @users = User.all
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new
    @job.title = job_params[:title]
    @job.user_id = current_user.id
    @job.company_id = job_params[:company]
    if @job.save
      redirect_to jobs_path
    else
      @errors = @job.errors.full_messages
      render 'new'
    end
  end

  def edit
     @job = Job.find(params[:id])
  end

  def destroy

  end

  private

  def job_params
    params.fetch(:job).permit(:title, :company)
  end
end
