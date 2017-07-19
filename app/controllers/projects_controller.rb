class ProjectsController < ApplicationController

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
      redirect_to root_path
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
    redirect_to root_path
  end


private
    def project_params
      params.require(:project).permit(:title, :description, :image)
    end
end
