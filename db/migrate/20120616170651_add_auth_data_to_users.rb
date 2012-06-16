class AddAuthDataToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :auth_hash
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
