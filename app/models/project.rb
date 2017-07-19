class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :likes, as: :likeable

  # has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
