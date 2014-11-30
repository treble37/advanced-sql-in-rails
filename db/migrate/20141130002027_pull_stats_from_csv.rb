require 'csv'

# http://stackoverflow.com/a/13972473
class PullStatsFromCsv < ActiveRecord::Migration
  def up
    CSV.foreach(statistics_csv_file, headers: true) do |row|
      Statistics.create!(row.to_hash)
    end
  end

  def down
    Statistics.destroy_all
  end

  #######
  private
  #######

  def statistics_csv_file
    File.join(Rails.root, 'db', 'csv', 'batting.csv')
  end
end
