class TableFormatter
  class Columns
    attr_reader :columns

    class << self
      # sugar
      def BuildFrom(rows)
        new(rows)
      end
    end

    def initialize(rows)
      @columns = build(rows.transpose)
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
