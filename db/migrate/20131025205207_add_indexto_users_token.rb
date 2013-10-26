class AddIndextoUsersToken < ActiveRecord::Migration
  def up
  	add_index :users, :remember_token
  end

  def down
  end
end
