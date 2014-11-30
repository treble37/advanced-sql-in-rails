# https://rietta.com/blog/2013/11/28/rails-and-sql-views-for-a-report/
class AddVwTotalHomeRuns < ActiveRecord::Migration
  def up
    execute <<-SQL.squish
      CREATE OR REPLACE VIEW vw_total_home_runs
        (
          player_id,
          year,
          total_home_runs,
          league
        ) AS SELECT player_id, year, SUM(IFNULL(s.home_runs, 0)), league
        FROM statistics s
        GROUP BY year, player_id, league
    SQL
  end

  def down
    execute "DROP VIEW IF EXISTS vw_total_home_runs"
  end
end
