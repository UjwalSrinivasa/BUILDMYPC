class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
  	add_index :users, :email, unique: true #Added so that an index is kept at each email column in the table ( to eliminate full database scan )
  end
end
