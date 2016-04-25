class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?


  protect_from_forgery with: :exception
  layout 'spacelab'


  protected

  def configure_permitted_parameters
      if resource_class == User
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :identifier) }
        devise_parameter_sanitizer.for(:update) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :identifier) }
      elsif resource_class == Lab
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :description) }
        devise_parameter_sanitizer.for(:update) { |u| u.permit(:email, :password, :password_confirmation, :name, :description) }
      elsif resource_class == Worker
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :identifier) }
        devise_parameter_sanitizer.for(:update) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :identifier) }
      elsif resource_class == Admin
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
        devise_parameter_sanitizer.for(:update) { |u| u.permit(:email, :password, :password_confirmation) }
      end
  end


end
