class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string  :player_id
      t.integer :birth_year
      t.string  :first_name
      t.string  :last_name
      t.timestamps
    end

    execute "ALTER TABLE players ADD INDEX player_id_idx (player_id)"
  end
end
