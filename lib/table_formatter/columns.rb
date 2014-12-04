class TableFormatter
  class Columns
    attr_reader :columns

    def initialize(raw_table)
      @columns = build(raw_table.transpose)
    end

    def max_widths_for_columns
      @column_data ||= columns.map { |col| col.max_width }
    end

    def appropriate_width_for(column_index)
      max_widths_for_columns[column_index]
    end

    #######
    private
    #######

    def build(columns)
      columns.map { |row| Column.new(row) }
    end
  end
end
