class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
      t.string :zipcode
      t.string :description
      t.string :city
      t.string :subcity
      t.float :latitude
      t.float :longitude
      t.boolean :active

      t.timestamps
    end
	add_index :zipcodes, [:zipcode]
	add_index :zipcodes, [:subcity]
  end
end
