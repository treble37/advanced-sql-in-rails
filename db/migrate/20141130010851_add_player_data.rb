require 'csv'

class AddPlayerData < ActiveRecord::Migration
  def up
    CSV.foreach(player_csv_file, headers: true) do |row|
      Player.create!(row.to_hash)
    end
  end

  def down
    Player.destroy_all
  end

  #######
  private
  #######

  def player_csv_file
    File.join(Rails.root, 'db', 'csv', 'master.csv')
  end
end
