class Order < ApplicationRecord
	belongs_to :user
	default_scope -> {order(updated_at: :desc)}
	has_many :order_details, dependent: :destroy
	has_many :products, through: :order_details, source: :product
end
