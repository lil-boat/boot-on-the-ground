class CompanyUser < ApplicationRecord
  belongs_to :user
  belongs_to :company

  def self.create_employee(company, user)
    where(company_id: company.id, user_id: user.id).first_or_create do |employee|
      employee.company_id = company.id
      employee.user_id = user.id
    end 
  end
end
