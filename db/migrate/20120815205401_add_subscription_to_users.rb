class AddSubscriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscribed, :boolean, default: false, null: false
  end
end
