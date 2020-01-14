class ProductTypesController < ApplicationController
	before_action :logged_in_user, only: [:new, :allitems, :edit, :update, :create, :destroy]
	before_action :admin_user, only: [:new, :allitems, :edit, :update, :create, :destroy]
	before_action :find_id, only: [:show, :edit, :update]

	def index
		@types = ProductType.paginate(page: params[:page]) 		#to get all the records to an instance variable(array in the case) lasts only until the scope lasts. Since the is defined in index, it lasts only till you are using the index view
	end

	def new
		@type = ProductType.new			#to create a new record into the respective model
	end

	def show		
		@products = Product.where(value: @type.value).paginate(page: params[:page])		#finding all the products whose value field is same as the type of product value(primary key) 
	end

	def create
		@type = ProductType.new(type_params)		#type params defined below in private class	
		if @type.save								#save the product created
			redirect_to root_url					#and redirect to root
		else										#if doesnt save and error occurs
			render 'new'							#error occurs and render 'new' view
		end
	end

	def edit
	end

	def update
		if @type.update(type_params)				#update the params
			redirect_to root_url					#if updated redirect to root
		else						
			render 'edit'							#else if error occurs render 'edit' view again
		end
	end

	def destroy
		ProductType.find(params[:id]).destroy		#destroy the record
		flash[:success] = "Delete Successful"
		redirect_to root_url						#redirect to root 
	end

	private

		def type_params
			params.require(:product_type).permit(:name,:value)  	#used to only permit type and value thorugh request(to prevent hacking) used in create and update action above
		end

		def logged_in_user
	      	unless logged_in?
	        	flash[:danger]="Routing Error"
	        	redirect_to home_url
	      	end
	    end

	    def admin_user
	     	redirect_to(root_url) unless current_user.admin?
	    end

	    def find_id
	    	@type = ProductType.find(params[:id])			#Finding the type of product click on
	    end
end
