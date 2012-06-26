class CreateDramas < ActiveRecord::Migration
  def change
    create_table :dramas do |t|
      t.text :description
      t.integer :creator_id

      t.timestamps
    end
  end
end
