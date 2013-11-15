class AddBooleanToInterest < ActiveRecord::Migration
  def change
    add_column :interests, :reserved, :boolean, default: false
  end
end
