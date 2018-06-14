class Product < ApplicationRecord
	has_many :shopping_carts, foreign_key: "product_id",
													 dependent: :destroy

	validates :name, presence: true, length: {maximum: 50}
	validates :unit_price, presence: true
	validates :category, presence: true

end
