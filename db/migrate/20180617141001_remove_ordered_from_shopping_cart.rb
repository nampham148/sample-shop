class RemoveOrderedFromShoppingCart < ActiveRecord::Migration[5.1]
  def change
  	remove_column :shopping_carts, :ordered
  end
end
