class Company < ApplicationRecord
  has_many :company_users
  has_many :users, through: :company_users

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>", large: "500x500>" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_logo

  def crop_logo
    logo.recreate_versions! if crop_x.present?
  end

  validates :name, :description, presence: true

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
    
  
end
