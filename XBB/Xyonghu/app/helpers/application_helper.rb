module ApplicationHelper
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

    def qiniu_url(url)
	    "http://olavg5ba4.bkt.clouddn.com/#{url}"
	end 
end
	

