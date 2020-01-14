module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id             #:user_id is a build in tool for login purposes, to access user id in subsequent pages( stored as a cookies )
	end

	def current_user
  		@current_user ||= User.find_by(id: session[:user_id])  #use of instance variable( which exists in the scope where it is defined ) to store the value
	end


 		 # Returns true if the user is logged in, false otherwise.
	def logged_in?
		!current_user.nil?
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	def not_found
  		raise ActionController::RoutingError.new('Not Found')
	end
end
