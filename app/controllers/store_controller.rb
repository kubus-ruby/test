class StoreController < ApplicationController
  def index
    @products = Product.find_products_for_sale
    @time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
		@cart = find_cart
  end

	def redirect_to_index(msg = nil)
		flash[:notice] = msg if msg
		redirect_to :action => 'index'
	end

 def add_to_cart
   product = Product.find(params[:id])
   @cart = find_cart
	 @current_item = @cart.add_product(product)
	 respond_to do |format|
			format.js if request.xhr?
			format.html {redirect_to_index}
	 end

 end

	def empty_cart
		session[:cart] = nil
		flash[:notice] = "Your cart is currently empty"
		redirect_to_index
	end

 private
 def find_cart
    session[:cart] ||= Cart.new
 end

end
