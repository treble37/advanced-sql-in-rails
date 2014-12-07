class TripleCrownQuery < Query
  attr_reader :year, :league

  def initialize(year, league, ctx=nil)
    super(ctx)

    @year    = year
    @league  = league
  end

  def prepare_results
    TripleCrownWinner.new(result_of_query.first).render
  end

  # there are 3 versions of this query that you can try/explain:
  # "yet_another_triple_crown_query"
  # "triple_crown_winner"
  # "improved_triple_crown"
  def query
    SqlLoader.new("yet_another_triple_crown_query").compile(binding)
  end
end
