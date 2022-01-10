class CreateRushings < ActiveRecord::Migration[7.0]
  def change
    create_table :rushings do |t|
      t.float :attempts_per_game
      t.integer :attempts
      t.integer :yards
      t.float :yards_per_attempt
      t.float :yards_per_game
      t.integer :touchdowns
      t.integer :longest
      t.integer :first_downs
      t.float :first_down_percentage
      t.integer :twenty_plus_yards
      t.integer :forty_plus_yards
      t.integer :fumbles

      t.timestamps
    end

    add_reference :rushings, :player, foreign_key: true, null: false
  end
end
