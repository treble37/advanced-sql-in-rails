# This was done just to do it. It's a silly thing to do.
# In case it's unclear: this is the AREL equivalent of
# the SQL found in app/sql/most_improved_batting_average.sql.erb.
class MostImprovedBattingAverage
  attr_reader :stats, :players
  attr_reader :from, :to, :min_at_bats

  def initialize(from, to, min_at_bats)
    @from, @to, @min_at_bats = from, to, min_at_bats

    @stats   = Statistics.arel_table
    @players = Player.arel_table
  end

  def to_sql
    (@to_sql ||= outermost_query).to_sql
  end

  def starting_year_batting_average
    @starting_year_batting_average ||= _starting_year_batting_average
  end

  def ending_year_batting_average
    @ending_year_batting_average ||= _ending_year_batting_average
  end

  #######
  private
  #######

  def outermost_query
    stats.project(
      players[:first_name],
      players[:last_name],
      starting_year_batting_average[:player_id],
      Arel::Nodes::Max.new([
        starting_year_batting_average[:btg_average_to] -
        starting_year_batting_average[:btg_average_from]
      ]).as('difference')
    ).from(
      starting_year_batting_average
    ).join(
      players
    ).on(
      starting_year_batting_average[:player_id].eq(
        players[:player_id]
      )
    ).group(
      starting_year_batting_average[:player_id]
    ).order(
      difference: :desc
    ).take(
      1
    )
  end

  # inner query
  def _starting_year_batting_average
    stats.project(
      stats[:player_id],
      batting_average.as('btg_average_from'),
      ending_year_batting_average[:btg_average].as('btg_average_to')
    ).from(
      stats
    ).join(
      ending_year_batting_average
    ).on(
      ending_year_batting_average[:player_id].eq(
        stats[:player_id]
      )
    ).where(
      stats[:year].eq(from).and(stats[:at_bats].gt(min_at_bats))
    ).group(
      stats[:year], stats[:player_id]
    ).as('s1')
  end

  # innermost query
  def _ending_year_batting_average
    stats.project(
      stats[:player_id],
      batting_average.as('btg_average')
    ).where(
      stats[:year].eq(to).and(stats[:at_bats].gt(min_at_bats))
    ).group(
      stats[:year], stats[:player_id]
    ).as('v1')
  end

  def batting_average
    Arel::Nodes::NamedFunction.new('IFNULL', [
      Arel::Nodes::InfixOperation.new(
        '/',
        Arel::Nodes::Sum.new([
          Arel::Nodes::NamedFunction.new('IFNULL', [stats[:hits], 0])
        ]),
        Arel::Nodes::Sum.new([
          Arel::Nodes::NamedFunction.new('IFNULL', [stats[:at_bats], 0])
        ])
      ), 0
    ])
  end
end
