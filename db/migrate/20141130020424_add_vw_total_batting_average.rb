class AddVwTotalBattingAverage < ActiveRecord::Migration
  def up
    execute <<-SQL.squish
      CREATE OR REPLACE VIEW vw_total_batting_averages
      (
        player_id,
        year,
        total_btg_avg,
        league
      ) AS SELECT player_id, year, SUM(IFNULL(hits, 0)) / SUM(IFNULL(at_bats, 0)), league
      FROM statistics s
      WHERE s.at_bats >= 400
      GROUP BY year, player_id
    SQL
  end

  def down
    execute "DROP VIEW IF EXISTS vw_total_batting_averages"
  end
end
