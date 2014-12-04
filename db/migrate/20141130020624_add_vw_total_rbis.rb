class AddVwTotalRbis < ActiveRecord::Migration
  def up
    execute SqlLoader.new('vw_total_rbis').compile
  end

  def down
    execute "DROP VIEW IF EXISTS vw_total_rbis"
  end
end
