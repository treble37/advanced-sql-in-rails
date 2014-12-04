class TeamSluggingPercentage
  attr_reader :results

  def initialize(results)
    @results = wrap_results(results)
  end

  def render
    if results.blank?
      "Error: no results for team slugging percentage calculation."
    else
      render_team_slugging_percentage
    end
  end

  def render_team_slugging_percentage
    results.map { |r| r.render(padding_for_report) }.join("\n")
  end

  def padding_for_report
    @padding_for_report ||= results.max_by(&:size).size
  end

  #######
  private
  #######

  def wrap_results(raw_results)
    raw_results.map { |result| SluggingPercentage.new(result) }
  end

end
