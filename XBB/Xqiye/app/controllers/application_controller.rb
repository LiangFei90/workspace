class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 def current_ability
    @current_ability ||= ::Ability.new(current_workeraccount)
  end

  def after_sign_in_path_for(resource)
    if current_workeraccount.has_role?(:admin)
      workeraccounts_path
    elsif current_workeraccount.has_role?(:yunying)
      cities_path
    elsif current_workeraccount.has_role?(:fenchengshi)
      price_rules_path
    end
  end

  def after_sign_out_path_for(resource)
    new_workeraccount_session_path
  end

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
