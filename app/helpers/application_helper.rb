module ApplicationHelper

	def full_title(page_title)
		base_title = "BuildMyPC"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	def products_sidebar
	    products = ProductType.all # Or whatever you like
	    render partial: "shared/products_sidebar", locals: {products: products}		   #locals sends the parameter @type through by defining type
  	end
end
