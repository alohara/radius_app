class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.string :radius_name
      t.integer :group_id
      t.string :group_name
      t.string :group_desc
      t.boolean :active, :default => false
      t.boolean :admin, :default => false

      t.timestamps
    end
	add_index :groups, [:group_id]
	add_index :groups, [:group_name]
  end
end
