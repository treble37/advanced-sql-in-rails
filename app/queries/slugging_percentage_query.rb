class SluggingPercentageQuery < Query
  attr_reader :year, :team

  def initialize(year, team, ctx=nil)
    super(ctx)

    @year = year
    @team = team
  end

  def prepare_results
    TeamSluggingPercentage.new(result_of_query).render
  end

  def query
    SqlLoader.new('slugging_percentage').compile(binding)
  end
end
