class Product < ApplicationRecord
	belongs_to :category
	has_many :shopping_carts, foreign_key: "product_id",
													 dependent: :destroy
	has_many :order_details, dependent: :destroy
	has_many :orders, through: :order_details, source: :order

	validates :name, presence: true, length: {maximum: 50}
	validates :unit_price, presence: true
	validates :category_id, presence: true

end
