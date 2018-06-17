class UpdateCategoryColumnProducts < ActiveRecord::Migration[5.1]
  def change
  	remove_column :products, :category
  	add_column :products, :category_id, :integer
  end
end
