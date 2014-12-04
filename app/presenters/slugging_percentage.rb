class SluggingPercentage
  extend Forwardable

  def_delegators :@result, :year, :team, :last_name, :first_name, :slugging_percentage

  def initialize(result)
    @result = result
  end

  def render(padding)
    [
      team_info,
      player_info(padding),
      slugging_percentage_info
    ].join(' ')
  end

  def size
    player_info.length
  end

  def team_info
    "#{year} #{team}:"
  end

  def player_info(padding = 0)
    "#{last_name}, #{first_name}".ljust(padding)
  end

  def slugging_percentage_info
    "- #{slugging_percentage}"
  end
end
