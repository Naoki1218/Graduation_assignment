class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path # ログアウト後に遷移するpath
  end

  protect_from_forgery with: :exception

  # helper_method :current_estimate
  #
  # def current_estimate
  #   if session[:estimate_id]
  #     @estimate = Estimate.find(session[:estimate_id])
  #   else
  #     @estimate = Estimate.create
  #     session[:estimate_id] = @estimate.id
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
