class StoreController < ApplicationController
  def index
    @products = Product.find_products_for_sale
    @time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
		@cart = find_cart
  end

 def add_to_cart
   product = Product.find(params[:id])
   @cart = find_cart
   @cart.add_product(product)
 end

	def empty_cart
		session[:cart] = nil
		flash[:notice] = "Your cart is currently empty"
		redirect_to :action => 'index'
	end

 private
 def find_cart
    session[:cart] ||= Cart.new
 end
 


end
