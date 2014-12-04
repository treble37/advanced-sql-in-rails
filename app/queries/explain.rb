class Explain
  attr_reader :query

  def initialize(query)
    @query = query
  end

  def execute
    TableFormatter.new(explain_result).render
  end

  #######
  private
  #######

  def explain_result
    ActiveRecord::Base.connection.execute("EXPLAIN #{query}")
  end
end
