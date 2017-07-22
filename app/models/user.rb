class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts 
  has_many :jobs
  has_many :user_projects 
  has_many :company_users
  has_many :projects, through: :user_projects
  has_many :companies, through: :company_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:linkedin]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name  
      user.image = auth.extra.raw_info.pictureUrls.values[1][0]
      user.location = auth.info.location
      user.description = auth.info.description
      user.company = auth.extra.raw_info.positions.values[1][0].company.name
      user.job_title = auth.extra.raw_info.positions.values[1][0].title
      user.job_location = auth.extra.raw_info.positions.values[1][0].location.name
    end
  end
end
