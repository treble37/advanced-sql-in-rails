class TableFormatter
  class Column
    attr_reader :column

    def initialize(column)
      @column = column
    end

    def max_width
      column.max_by { |col| col.to_s.length }.to_s.length
    end
  end
end
