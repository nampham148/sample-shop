class AddQuantityToOrderDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :order_details, :quantity, :integer
  end
end
