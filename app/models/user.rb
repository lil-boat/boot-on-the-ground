class User < ApplicationRecord
  has_many :posts, :comments, :likes, :jobs, :user_projects, :companies_users
  has_many :projects, through: :user_projects
  has_many :companies, through: :companies_users
end
