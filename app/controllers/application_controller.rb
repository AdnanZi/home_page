class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  	def authenticate
  		auth = authenticate_or_request_with_http_basic do |username, password|
        # Fix for deployed version 
        # to use Heroku ENV variables
        userName = defined?(USERNAME) != nil ? USERNAME : ENV['USERNAME']
        pass = defined?(PASSWORD) != nil ? PASSWORD : ENV['PASSWORD']

  			username == userName && password == pass	
  		end

  		session[:authenticated] = auth if auth === true
  	end
end
