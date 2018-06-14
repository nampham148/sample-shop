class CreateShoppingCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_carts do |t|
      t.references :user, foreign_key: true
      t.integer :product_id
      t.integer :quantity
      t.boolean :ordered, default: false

      t.timestamps
    end
  end
end
