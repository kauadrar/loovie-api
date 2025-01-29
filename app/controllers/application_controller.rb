class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action { puts response.body }

  protected

  def configure_permitted_parameters
    added_attrs = [ :username, :email, :password, :first_name, :last_name, :birthday, :password_confirmation, :remember_me ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [ :login, :password ]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
