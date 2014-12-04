class Query
  attr_reader :ctx
  attr_accessor :result_of_query

  def initialize(ctx = Statistics)
    @ctx = ctx
  end

  def explain
    Explain.new(query).execute
  end

  def execute
    run_query
    prepare_results
  end

  #######
  private
  #######

  def run_query
    self.result_of_query = run(query)
  end

  def run(sql)
    ctx.find_by_sql(sql)
  end

  def query
    raise NotImplementedError
  end

  def prepare_results
    raise NotImplementedError
  end
end
