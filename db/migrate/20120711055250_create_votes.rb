class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :drama_id
      t.integer :voter_id

      t.timestamps
    end

    add_index :votes, [:drama_id, :voter_id], unique: true
  end
end
