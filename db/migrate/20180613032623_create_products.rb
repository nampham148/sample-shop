class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.float :unit_price
      t.string :category

      t.timestamps
    end
  end
end
