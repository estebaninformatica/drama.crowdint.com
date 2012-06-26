class AddCanDramateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :can_dramate, :bool
  end
end
