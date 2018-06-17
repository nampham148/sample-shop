class ShoppingCart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  default_scope -> {order(updated_at: :desc)}
  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :quantity, presence: true
end
