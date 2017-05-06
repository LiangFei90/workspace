class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
<<<<<<< HEAD

  #before_action :authenticate_workeraccount!

  def hello
  	render html: "Hello world"
  end

  
=======
<<<<<<< HEAD
  before_filter :authenticate_workeraccount!
=======
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
>>>>>>> a5663897c55a8ecee9dca7a122a38b6a2d60e97d

>>>>>>> 66c11b31a6eb26d267c2ca3ed6a10e0a6b24c811
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
<<<<<<< HEAD
=======

<<<<<<< HEAD

=======
>>>>>>> a5663897c55a8ecee9dca7a122a38b6a2d60e97d
>>>>>>> 66c11b31a6eb26d267c2ca3ed6a10e0a6b24c811
end
