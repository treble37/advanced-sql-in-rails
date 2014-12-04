class AddVwTotalBattingAverage < ActiveRecord::Migration
  def up
    execute SqlLoader.new('vw_total_batting_averages').compile
  end

  def down
    execute "DROP VIEW IF EXISTS vw_total_batting_averages"
  end
end
