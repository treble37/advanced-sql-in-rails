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

  def query
    SqlLoader.new('improved_triple_crown').compile(binding)
  end
end
