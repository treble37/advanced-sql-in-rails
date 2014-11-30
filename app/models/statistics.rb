class Statistics < ActiveRecord::Base
  class << self
    def triple_crown_winner(year, league)
      TripleCrownQuery.new(year, league, self).execute
    end
  end
end

# save some keystrokes in console...
Stats = Statistics
