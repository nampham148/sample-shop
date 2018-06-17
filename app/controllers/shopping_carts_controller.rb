class ShoppingCartsController < ApplicationController
	before_action :logged_in_user
	before_action :correct_user, only: [:destroy, :update]

	def index
		@shopping_carts = current_user.shopping_carts
	end

	def create
		product_id = params[:product_id]
		quantity = params[:shopping_cart][:quantity]
		current_user.add_to_cart(product_id, quantity)
		flash[:success] = "Item added to cart!"
		redirect_to root_url
	end

	def update
		quantity = params[:shopping_cart][:quantity]
		if quantity.to_i > 0
			@cart.update_attributes(quantity: params[:shopping_cart][:quantity])
			flash[:success] = "Successfully update quantity"
		else
			flash[:danger] = "Quantity must be greater than 0"
		end
		redirect_to shopping_carts_url
	end

	def destroy
		@cart.destroy
		flash[:success] = "Successfully remove item!"
		redirect_to shopping_carts_url
	end

	private
		def logged_in_user
			unless logged_in?
				flash[:danger] = "Please login first!"
				redirect_to login_url
			end
		end

		def correct_user
			@cart = ShoppingCart.find(params[:id])
			unless current_user.id == @cart.user_id
				redirect_to root_url
			end
		end

end
