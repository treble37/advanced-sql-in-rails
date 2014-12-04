class TableFormatter
  class Table
    attr_reader :table, :transposed_table

    def initialize(raw_table)
      @transposed_table = TransposedTable.new(raw_table)
      @table            = build(raw_table)
    end

    def render
      table.map { |row| row.render }
    end

    #######
    private
    #######

    def build(table)
      table.map { |row| Row.new(row, transposed_table) }
    end
  end
end
