class Statistics < ActiveRecord::Base
  class << self
    def triple_crown_winner(year, league)
      TripleCrownQuery.new(year, league, self).execute
    end

    def most_improved_batting_average(from_year, to_year)
      MostImprovedBattingAverageQuery.new(from_year, to_year, self).execute
    end

    def slugging_percentage(year, team)
      SluggingPercentageQuery.new(year, team, self).execute
    end
  end
end
