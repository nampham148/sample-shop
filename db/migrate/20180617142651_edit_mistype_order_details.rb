class EditMistypeOrderDetails < ActiveRecord::Migration[5.1]
  def change
  	remove_column :order_details, :integer
  	remove_column :order_details, :order_id
  	add_column :order_details, :order_id, :integer
  end
end
