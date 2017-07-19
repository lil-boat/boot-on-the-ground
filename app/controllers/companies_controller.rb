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
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
          format.html { redirect_to companies_path, notice: "Company Created" }
          format.json { render :index }
          format.js
      else 
          format.html { render :new}
          format.json { render json: @company.errors }
          format.js
      end
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if  @company.update_attributes(company_params)
      redirect_to '/companies'
    else 
      @errors = @company.errors.full_messages
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
