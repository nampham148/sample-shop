class User < ApplicationRecord
	has_many :shopping_carts, dependent: :destroy
	has_many :orders, dependent: :destroy

	#has_many :cart_items, through: :shopping_carts, source: :product

	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, 
										uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: {minimum: 6}, allow_nil: true

	def add_to_cart(product_id, quantity)
		if self.shopping_carts.map(&:product).include?(Product.find(product_id))
			self.shopping_carts.find_by(product_id: product_id).increment!('quantity', quantity.to_i)
		else
			self.shopping_carts.create!(product_id: product_id, quantity: quantity)
		end
	end

	def remove_cart(shopping_carts)
		shopping_carts.destroy
	end

	#TODO: update accordingly
	def order_cart(shopping_carts)
			shopping_carts.update_attributes(ordered: true)
	end

end
