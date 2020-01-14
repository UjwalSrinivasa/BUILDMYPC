class AddIndexToProductsValue < ActiveRecord::Migration[5.1]
  def change
  	add_index :products, :value
  end
end
