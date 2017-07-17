class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts 
  has_many :jobs
  has_many :user_projects 
  has_many :companies_users
  has_many :projects, through: :user_projects
  has_many :companies, through: :companies_users

  has_secure_password

end
