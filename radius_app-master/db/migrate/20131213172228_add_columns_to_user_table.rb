class AddColumnsToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :twitter_acct, :boolean
    add_column :users, :twitter_id, :integer
    add_column :users, :tweet_since_id, :bigint
  end
end
