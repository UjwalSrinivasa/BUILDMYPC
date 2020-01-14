class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    	log_in user
      flash[:success] = "Welcome to BuildMyPc"
    	redirect_to root_url
    else
	    flash.now[:danger] = 'Invalid email/password combination'    #use flash.now for rendering views
	    render 'new'			#render is not considered as a request and since flash messages persist for one request, they will be visible for render and not for redirect
    end
  end

  def destroy
  	log_out
    flash[:success] = "Successfully Logged Out"
  	redirect_to root_url
  end 
end
