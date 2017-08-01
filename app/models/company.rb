class Company < ApplicationRecord
  require 'json'
  require 'httparty'


  has_many :company_users
  has_many :users, through: :company_users

  validates :name, :description, presence: true

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>", large: "500x500>" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  validates :name, presence: true

  def self.create_company(auth)
    where(name: auth.company).first_or_create do |company|
    x = auth.company.strip
    
    request = HTTParty.get("https://company.clearbit.com/v1/companies/search?query=name:#{x}", :headers =>{'Content-Type' => 'application/json' , 'authorization' => ENV["HTTP_CLEARBIT_KEY"]})
    
    logo = request['results'][0]['logo']
    domain = request['results'][0]['domain']
    
    if logo 
      company.image = logo
    end 
    if domain
      company.url = domain
    end
    company.name = auth.company
    company.location = auth.job_location
    end
  end
  mount_uploader :avatar, AvatarUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar

  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
    
end
