class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts 
  has_many :jobs
  has_many :user_projects 
  has_many :company_users
  has_many :projects, through: :user_projects
  has_many :companies, through: :company_users

  has_secure_password

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
