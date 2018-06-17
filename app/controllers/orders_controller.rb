class OrdersController < ApplicationController
	before_action :logged_in_user
	before_action :correct_user, only: [:show]

	def index
		@orders = current_user.orders
	end

	def create
		shopping_carts = current_user.shopping_carts
		if shopping_carts.empty?
			flash[:danger] = "Please add something to the cart!"
			redirect_to root_url
		else
			@order = current_user.orders.create!()
			shopping_carts.each do |shopping_cart|
				@order.order_details.create!(product_id: shopping_cart.product_id, quantity: shopping_cart.id)
				shopping_cart.destroy
			end
			flash[:success] = "Order successfully!"
			redirect_to orders_url
		end
	end

	def show		
	end

	private
		def logged_in_user
			unless logged_in?
				flash[:danger] = "Please login first!"
				redirect_to login_url
			end
		end

		def correct_user
			@order = Order.find(params[:id])
			unless current_user == @order.user
				redirect_to root_url
			end
		end
end
