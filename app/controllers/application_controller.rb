class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller? # by using before_filter we say run this before everything else in control\llers because we are in app controller

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])           # only works in rails 5
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
