class Company < ApplicationRecord
  has_many :company_users
  has_many :users, through: :company_users

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  validates :name, :description, presence: true
end
