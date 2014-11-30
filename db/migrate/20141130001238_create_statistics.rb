class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string  :player_id
      t.integer :year
      t.string  :team
      t.string  :league
      t.integer :games
      t.integer :at_bats
      t.integer :runs
      t.integer :hits
      t.integer :doubles
      t.integer :triples
      t.integer :home_runs
      t.integer :runs_batted_in
      t.integer :stolen_bases
      t.integer :caught_stealing
      t.timestamps
    end

    execute "ALTER TABLE statistics ADD INDEX year_player_id_idx (year, player_id)"
    execute "ALTER TABLE statistics ADD INDEX year_player_id_league_idx (year, player_id, league)"
  end
end
