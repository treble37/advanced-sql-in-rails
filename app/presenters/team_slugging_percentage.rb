class TeamSluggingPercentage
  attr_reader :results

  def initialize(results)
    @results = build(results)
  end

  def render
    if results.blank?
      "Error: no results for team slugging percentage calculation."
    else
      render_team_slugging_percentage
    end
  end

  def render_team_slugging_percentage
    TableFormatter.new(results).render
  end

  #######
  private
  #######

  def build(results)
    results.map { |result| SluggingPercentage.new(result).render }
  end

end
