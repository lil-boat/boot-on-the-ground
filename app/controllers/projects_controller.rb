class ProjectsController < ApplicationController
before_action :authenticate_user!
  def index
    @projects = Project.all
  end

  def new
    if current_user
      @project = Project.new
    else
      redirect_to root_path
    end
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      @user_project = UserProject.create(user_id: current_user.id, project_id: @project.id)
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end


  def edit
    @project = Project.find(params[:id])

  end

  def update
    @project = Project.find(params[:id])
    if @project.update(params[:project].permit(:title, :description))
      redirect_to "projects#index"
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to user_path(current_user)
  end


private
    def project_params
      params.require(:project).permit(:title, :description, :image, :url, :project_seed_pic)
    end
end
