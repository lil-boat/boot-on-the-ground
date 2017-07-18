class CompaniesController < ApplicationController
  
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    redirect_to '/companies'
  end

  def edit
    
  end

  def destroy
    
  end

  private 

  def company_params
    params.fetch(:company).permit(:name, :description, :logo, :url)
  end  

end
