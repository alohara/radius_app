class CreateRadiusposts < ActiveRecord::Migration
  def change
    create_table :radiusposts do |t|
      t.integer  :user_id
      t.string   :content
	  t.integer  :interest_id
	  t.string   :interest
	  t.float    :latitude
	  t.float    :longitude
	  t.float    :ip_address
	  t.string   :zipcode
	  t.boolean  :visible
	  t.integer  :group_id
	  t.string   :group_name
	  t.datetime :eff_timestamp
	  t.datetime :expires_in

      t.timestamps
    end
	add_index :radiusposts, [:user_id, :created_at]
  end
end
