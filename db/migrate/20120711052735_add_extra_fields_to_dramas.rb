class AddExtraFieldsToDramas < ActiveRecord::Migration
  def change
    add_column :dramas, :state, :string
  end
end
