class CompaniesController < ApplicationController
  
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def show
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
    @company.update_attributes(company_params)
    redirect_to '/companies'
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
