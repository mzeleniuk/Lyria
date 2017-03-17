class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def after_sign_in_path_for(_resource)
    rooms_path
  end
end
