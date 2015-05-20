class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :category
      t.string :category_desc
      t.boolean :active

      t.timestamps
    end
  end
end
