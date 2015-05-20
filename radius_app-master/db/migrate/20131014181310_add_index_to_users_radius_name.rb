class AddIndexToUsersRadiusName < ActiveRecord::Migration
  def change
    add_index :users, :radius_name, unique: true
	add_index :user_profiles, :email, unique: true
  end
end
