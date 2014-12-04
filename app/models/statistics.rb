class Statistics < ActiveRecord::Base
  class << self
    def triple_crown_winner(year, league)
      TripleCrownQuery.new(year, league, self).execute
    end

    def most_improved_batting_average(from_year, to_year, arel=false)
      MostImprovedBattingAverageQuery.new(from_year, to_year, self, arel).execute
    end
  end
end

# save some keystrokes in console...
Stats = Statistics
