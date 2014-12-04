class MostImprovedBattingAverageQuery < Query

  attr_reader :from_year, :to_year, :min_at_bats

  def initialize(from_year, to_year, ctx=nil, arel=false)
    super(ctx)

    @from_year = from_year
    @to_year   = to_year
    @arel      = arel

    @min_at_bats = 200
  end

  def arel?
    @arel
  end

  def query
    arel? ? arel_query : sql_query
  end

  def prepare_results
    MostImproved.new(self).render
  end

  def sql_query
    SqlLoader.new('most_improved_batting_average').compile(binding)
  end

  def arel_query
    MostImprovedBattingAverage.new(from_year, to_year, min_at_bats).to_sql
  end
end
