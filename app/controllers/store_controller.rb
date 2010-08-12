class StoreController < ApplicationController
before_filter :find_cart, :except => :empty_cart

  def index
    @products = Product.find_products_for_sale
    @time = Time.now.strftime("%Y-%m-%d %H:%M:%S")

		if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] +=1
    end
  end

	def redirect_to_index(msg = nil)
		flash[:notice] = msg if msg
		redirect_to :action => 'index'
	end

 def add_to_cart
   product = Product.find(params[:id])
	 @current_item = @cart.add_product(product)

	 session[:counter] = nil

	 respond_to do |format|
			format.js if request.xhr?
			format.html {redirect_to_index}
	 end

 end

	def empty_cart
		session[:cart] = nil
		flash[:notice] = "Your cart is currently empty"
		respond_to do |format|
		  format.js if request.xhr?
      format.html{redirect_to_index}
		end
	end

	def checkout
		if @cart.items.empty?
			redirect_to_index("Your cart is empty" )
		else
			@order = Order.new
		end
	end

	def save_order
		@order = Order.new(params[:order])
		@order.add_line_items_from_cart(@cart)
		if @order.save
			session[:cart] = nil
			redirect_to_index("Thank you for your order" )
		else
			render :action => 'checkout'
		end
	end


 private
 def find_cart
    @cart = session[:cart] ||= Cart.new
 end

	protected
	def authorize
	end

end
