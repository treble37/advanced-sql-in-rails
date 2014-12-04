# https://rietta.com/blog/2013/11/28/rails-and-sql-views-for-a-report/
class AddVwTotalHomeRuns < ActiveRecord::Migration
  def up
    execute SqlLoader.new('vw_total_home_runs').compile
  end

  def down
    execute "DROP VIEW IF EXISTS vw_total_home_runs"
  end
end
