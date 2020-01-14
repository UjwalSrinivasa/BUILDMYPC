class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   include SessionsHelper		#so that all the views of different controllers have access to this, since they inherit from the base class(app contrller)
end
