class TestimonialsController < ApplicationController
before_action :user_is_logged_in  
  def index
    @users = User.all
  end
end
