class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :likes, as: :likeable
end
