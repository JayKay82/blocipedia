class AddPremiumAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :premium_at, :datetime
  end
end
