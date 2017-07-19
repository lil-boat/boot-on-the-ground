class Company < ApplicationRecord
  has_many :company_users
  has_many :users, through: :company_users

  validates :name, :description, presence: true
end
