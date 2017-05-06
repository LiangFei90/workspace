class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   
  def current_city
    unless session[:current_city_id]
      session[:current_city_id] = City.first.id
    end
    
    if session[:current_city_id]
      @current_city ||= City.find(session[:current_city_id])
    else
      @current_city = nil
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:mobile, :email, :password, :password_confirmation, :remember_me, :name]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
