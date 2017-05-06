class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_workeraccount!

  def current_city
    unless session[:current_city_id]
      session[:current_city_id] = current_workeraccount.cities.first.id if current_workeraccount.cities.first
    end
    if session[:current_city_id]
      @current_city ||= City.find(session[:current_city_id])
    else
      @current_city = nil
    end
  end


end
