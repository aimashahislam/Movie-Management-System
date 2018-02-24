class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    # Here you can write logic based on roles to return different after sign in paths
    if current_user.admin == true
      admin_home_index_path
    else
      root_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_no, :gender, :date_of_birth, :status, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_no, :gender, :date_of_birth, :status, :avatar])
  end
end
