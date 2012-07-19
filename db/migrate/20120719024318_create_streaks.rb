class CreateStreaks < ActiveRecord::Migration
  def change
    create_table :streaks do |t|
      t.integer :days_without_drama

      t.timestamps
    end
  end
end
