class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?
  helper_method :cart_id

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation)}
  end

  def cart_id
    Cart.where(user_id: current_user).first.id
  end
end
