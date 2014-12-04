class MostImproved
  extend Forwardable

  def_delegators :@result, :first_name, :last_name, :difference

  attr_reader :from_year, :to_year

  def initialize(query)
    @from_year = query.from_year
    @to_year   = query.to_year
    @result    = query.result_of_query.first
  end

  def result?
    @result
  end

  def render
    if result?
      winner_message
    else
      no_winner_message
    end
  end

  def winner_message
    <<-MSG.squish
    Most Improved Batting Average from #{from_year} to #{to_year}:
    #{first_name.capitalize} #{last_name.capitalize} - #{difference} improvement
    MSG
  end

  def no_winner_message
    "Error: no result was found."
  end
end
