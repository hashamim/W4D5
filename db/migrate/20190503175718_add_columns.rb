class AddColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :session_token, :string
    remove_column :users, :password
  end
end
