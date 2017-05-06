module ApplicationHelper
  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      next if type == :timeout
      type = :success if type == 'notice'
      type = :danger   if type == 'alert'
      text = content_tag(:div,
       content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
       message, :class => "alert fade in alert-#{type}")
      flash_messages << text if message
    end
    flash_messages.join("\n").html_safe
  end

  def is_active?(expected_value, actual_value)
    expected_value == actual_value ? 'active' : ''
  end
<<<<<<< HEAD

=======
  def qiniu_url(url)
    "http://olavg5ba4.bkt.clouddn.com/#{url}"
  end
  
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

  
>>>>>>> 66c11b31a6eb26d267c2ca3ed6a10e0a6b24c811
end
