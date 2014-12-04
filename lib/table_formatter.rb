class TableFormatter
  attr_reader :table

  def initialize(raw_result)
    @table = Table.new(raw_result.to_a)
  end

  def render
    table.render
  end
end
