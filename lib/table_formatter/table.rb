class TableFormatter
  class Table
    attr_reader :rows, :columns

    def initialize(raw_table)
      @columns = Columns.new(raw_table)
      @rows    = build(raw_table)
    end

    def render
      rows.map { |row| row.render }
    end

    def appropriate_width_for(column_index)
      columns.appropriate_width_for(column_index)
    end

    #######
    private
    #######

    def build(table)
      table.map { |row| Row.new(row, self) }
    end
  end
end
