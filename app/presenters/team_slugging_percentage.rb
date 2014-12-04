class TeamSluggingPercentage
  attr_reader :results

  def initialize(results)
    @results = results
  end

  def render
    if results.blank?
      "Error: no results for team slugging percentage calculation."
    else
      results.map do |result|
        SluggingPercentage.new(result).render
      end.join("\n")
    end
  end

end
