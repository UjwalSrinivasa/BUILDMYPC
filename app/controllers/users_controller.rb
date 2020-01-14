class UsersController < ApplicationController
	before_action :logged_in_user
	before_action :admin_user

	def index
		@users = User.paginate(page: params[:page])
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user= User.new(user_params)
		if @user.save
			log_in @user
			flash[:success]="Welcome to Build my PC"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
    	@user = User.find(params[:id])
    	if @user.update_attributes(user_params)
      		redirect_to home_url
    	else
      		render 'edit'
    	end
 	end

 	def destroy
    	User.find(params[:id]).destroy
    	flash[:success] = "User deleted"
    	redirect_to users_url
  	end

  	private

	  	def user_params
	  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  	end

	  		    # Confirms a logged-in user.
	    def logged_in_user
	      	unless logged_in?
	        	flash[:danger]="Routing Error"
	        	redirect_to home_url
	      	end
	    end

	    def admin_user

	     	redirect_to(root_url) unless current_user.admin?
	     	
	    end
end
