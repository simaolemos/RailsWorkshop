class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_sign_up_params if :devise_controller?

  private
  # Overwriting the sign_out redirect path method
  # def after_sign_out_path_for(resource_or_scope)
  #   root_path
  # end
  #
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
