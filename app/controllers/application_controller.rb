class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  	def authenticate
  		auth = authenticate_or_request_with_http_basic do |username, password|
  			username == USERNAME && password == PASSWORD	
  		end

  		session[:authenticated] = auth if auth === true
  	end
end
