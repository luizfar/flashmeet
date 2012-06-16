class AddAuthHashToUser < ActiveRecord::Migration
  def change
    add_column :user, :auth_hash, :text
  end
end
