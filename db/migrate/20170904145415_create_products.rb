class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :value
      t.text :description
      t.text :specification
      t.decimal :price

      t.timestamps
    end
  end
end
