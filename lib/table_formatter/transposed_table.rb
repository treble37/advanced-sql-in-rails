class TableFormatter
  class TransposedTable
    attr_reader :table

    def initialize(table)
      @table = build(table.transpose)
    end

    def max_widths_for_columns
      @column_data ||= table.map { |col| col.max_width }
    end

    def appropriate_width_for(column_index)
      max_widths_for_columns[column_index]
    end

    #######
    private
    #######

    def build(table)
      table.map { |row| TransposedRow.new(row) }
    end
  end
end
