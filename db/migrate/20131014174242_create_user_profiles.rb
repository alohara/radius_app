class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.string :email
	  t.string :default_zipcode
	  t.integer :default_radius
	  t.string  :gender
	  t.float  :latitude
	  t.float  :longitude
	  t.string :security_one
	  t.string :answer_one
	  t.string :security_two
	  t.string :answer_two

      t.timestamps
    end
  end
end
