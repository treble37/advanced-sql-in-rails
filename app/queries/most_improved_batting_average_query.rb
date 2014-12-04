class MostImprovedBattingAverageQuery
  MIN_AT_BATS = 200

  attr_reader :from_year, :to_year, :ctx
  attr_accessor :result_of_query

  def initialize(from_year, to_year, ctx, arel=false)
    @from_year = from_year
    @to_year   = to_year
    @ctx       = ctx
    @arel      = arel
  end

  def arel?
    @arel
  end

  def execute
    run_query
    prepare_results
  end

  def run_query
    self.result_of_query = ctx.find_by_sql(query)
  end

  def query
    arel? ? arel_query : sql_query
  end

  def prepare_results
    MostImproved.new(self).results
  end

  def sql_query
    SqlLoader.new('most_improved_batting_average').compile(binding)
  end

  def arel_query
    MostImprovedBattingAverage.new(from_year, to_year, min_at_bats).to_sql
  end

  def min_at_bats
    MIN_AT_BATS
  end
end
