class AddFieldsToRadiuspostModel < ActiveRecord::Migration
  def change
    add_column :radiusposts, :radius_name, :string, :after => :user_id
    add_column :radiusposts, :city, :string, :after => :zipcode
    add_column :radiusposts, :subcity, :string, :after => :city
	add_index :radiusposts, [:zipcode]
	add_index :radiusposts, [:city]
	add_index :radiusposts, [:latitude, :longitude]
  end
end
