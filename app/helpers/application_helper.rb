module ApplicationHelper
	def loggedIn?
		session[:authenticated] === true
	end
end
