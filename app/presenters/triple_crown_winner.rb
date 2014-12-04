class TripleCrownWinner
  extend Forwardable

  def_delegators :@winner, :first_name, :last_name, :year, :league

  def initialize(winner)
    @winner = winner
  end

  def winner?
    @winner
  end

  def results
    if winner?
      winner_message
    else
      no_winner_message
    end
  end

  def winner_message
    "#{year} #{league} Triple Crown Winner: #{first_name.capitalize} #{last_name.capitalize}"
  end

  def no_winner_message
    "(No Winner)"
  end
end
