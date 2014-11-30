class AddVwTotalRbis < ActiveRecord::Migration
  def up
    execute <<-SQL.squish
    CREATE OR REPLACE VIEW vw_total_rbis
      (
        player_id,
        year,
        total_rbis,
        league
      ) AS SELECT player_id, year, sum(ifnull(runs_batted_in, 0)), league
      FROM statistics
      GROUP BY year, player_id
    SQL
  end

  def down
    execute "DROP VIEW IF EXISTS vw_total_rbis"
  end
end
