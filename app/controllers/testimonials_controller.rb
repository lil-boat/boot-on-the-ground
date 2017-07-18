class TestimonialsController < ApplicationController
  def index
    @users = User.all
  end
end
