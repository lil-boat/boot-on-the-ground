class CompaniesController < ApplicationController
  
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    redirect_to companies_path
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
     if @company.update(params[:company].permit(:name, :description, :logo, :url ))
      redirect_to companies_path
    else
      render 'edit'
    end 
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end

  private 

  def company_params
    params.fetch(:company).permit(:name, :description, :logo, :url)
  end  

end
