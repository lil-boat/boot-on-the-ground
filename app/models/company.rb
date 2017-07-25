class Company < ApplicationRecord
  has_many :company_users
  has_many :users, through: :company_users

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  validates :name, presence: true

  def self.create_company(auth)
    where(name: auth.extra.raw_info.positions.values[1][0].company.name, location: auth.extra.raw_info.positions.values[1][0].location.name).first_or_create do |company|
    company.name = auth.extra.raw_info.positions.values[1][0].company.name
    company.location = auth.extra.raw_info.positions.values[1][0].location.name
    end
  end
end
