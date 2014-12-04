class SluggingPercentageQuery
  attr_reader :year, :team, :ctx

  attr_accessor :result_of_query

  def initialize(year, team, ctx)
    @year = year
    @team = team
    @ctx  = ctx
  end

  def execute
    run_query
    prepare_results
  end

  def run_query
    self.result_of_query = ctx.find_by_sql(query)
  end

  def prepare_results
    TeamSluggingPercentage.new(result_of_query).render
  end

  def query
    SqlLoader.new('slugging_percentage').compile(binding)
  end
end
