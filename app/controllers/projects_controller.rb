class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    
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
    redirect_to root_path
  end


private
    def project_params
      params.require(:project).permit(:title, :description)
    end
end
