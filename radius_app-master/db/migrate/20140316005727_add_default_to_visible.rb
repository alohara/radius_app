class AddDefaultToVisible < ActiveRecord::Migration
  def change
    change_column :radiusposts, :visible, :boolean, default: true
  end
end
