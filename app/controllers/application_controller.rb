class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery
  
  protected
	
	def layout_by_resource
	  if devise_controller? && resource_name == :user
	    "empty"
	  else
	    "application"
	  end
	end
	
	def parse_html(note)
	   require 'nokogiri'
      require 'open-uri'
      params = []
      @title = "no title"
		@url = note.link
		begin
			response = open(@url,"User-Agent" => "Mozilla/5.0 
			(Windows NT 6.0; rv:12.0) Gecko/20100101 Firefox/12.0 FirePHP/0.7.1")	
			@doc = Nokogiri::HTML(response)
			@title = @doc.at_css("title").text
			@desc = @doc.at_css("meta[@name='description']/@content").value
		rescue
		end
		params[0] = @title
		params[1] = @desc
		return params
	end
end
