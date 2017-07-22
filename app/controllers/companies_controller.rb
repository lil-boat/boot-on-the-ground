class CompaniesController < ApplicationController
before_action :user_is_logged_in
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
    if @company.save
      if params[:company][:avatar].blank?
        redirect_to companies_path
      else
        render 'crop'
      end
    else
      @errors = @company.errors.full_messages
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if  @company.update_attributes(company_params)
      if params[:company][:avatar].blank?
        redirect_to companies_path
      else
        render :action => 'crop'
      end
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
    params.fetch(:company).permit(:name, :description, :logo, :url, :avatar, :crop_x, :crop_y, :crop_w, :crop_h)
  end

end
