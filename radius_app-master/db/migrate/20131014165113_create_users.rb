class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :first_name
      t.string   :last_name
	  t.string   :radius_name
      t.string   :password_digest
      t.string   :remember_token
      t.boolean  :admin,          :default => false
	  t.boolean  :business,       :default => false
      t.boolean  :active,         :default => true
      
	  t.timestamps
    end
  end
end
