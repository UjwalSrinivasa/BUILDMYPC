class ProductsController < ApplicationController
	before_action :logged_in_user, only: [:new, :allitems, :edit, :update, :create, :destroy]
	before_action :admin_user, only: [:new, :allitems, :edit, :update, :create, :destroy]
	before_action :find_id, only: [:edit, :show, :update, :destroy]
	before_action :for_new, only: [:new, :allitems]

	def index
		@products = Product.paginate(page: params[:page])		#All products or each and every type
	end

	def allitems			#For the new action in the view listing products of all types
	end

	def new   		#For the new action for a specific type of product
	end

	def edit
	end

	def show
	end

	def update
		if @product.update(product_params)
			if params[:val] == "true"
				redirect_to product_path 		#Show action view
			else
				redirect_to products_url		#Index action view
			end
		else
			render 'edit'
		end
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			if params[:val] == "true"
				product_id = ProductType.find_by(value: @product.value)
				redirect_to product_type_path(product_id.id)
			else
				redirect_to products_path
			end
		elsif params[:val] == "true"
			render 'new'
		else
			render 'allitems'
		end
	end

	def destroy
		@product.destroy
		if params[:val] == "true"
			product_id = ProductType.find_by(value: @product.value)
			redirect_to product_type_path(product_id.id)
		else
			redirect_to products_path
		end
	end

	private

		def product_params
			params.require(:product).permit(:name,:value,:description,:specification,:price,:image)
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
	    	@product = Product.find(params[:id])
	    end

	    def for_new
	    	@product = Product.new
	    end

end