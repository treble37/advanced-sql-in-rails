class TripleCrownQuery

  attr_reader :year, :league, :ctx
  attr_accessor :result_of_query

  def initialize(year, league, ctx)
    @year    = year
    @league  = league
    @ctx     = ctx
  end

  def execute
    run_query
    prepare_results
  end

  def run_query
    self.result_of_query = ctx.find_by_sql(triple_crown_winner_query)
  end

  def prepare_results
    TripleCrownWinner.new(result_of_query.first).render
  end

  def triple_crown_winner_query
    SqlLoader.new('triple_crown_winner').compile(binding)
  end
end
