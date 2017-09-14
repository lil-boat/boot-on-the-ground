class HomeController < ApplicationController

  def index
    @no_header = true
    # self.resource = resource_class.new(sign_in_params)
    # clean_up_passwords(resource)
    # yield resource if block_given?
    # respond_with(resource, serialize_options(resource))
  end
end

private

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end