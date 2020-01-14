class AddPasswordDigestToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_digest, :string	#added so that an encrypted password is stored in database instead of a string (easily used by has_secure_password)
  end
end
