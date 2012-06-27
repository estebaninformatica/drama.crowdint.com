class AddDramaDateToDramas < ActiveRecord::Migration
  def change
    add_column :dramas, :drama_at, :timestamp
  end
end
