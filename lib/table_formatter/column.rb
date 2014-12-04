class TableFormatter
  class Column
    attr_reader :column

    def initialize(column)
      @column = column
    end

    def max_width
      column.max { |a,b| a.to_s.length <=> b.to_s.length }.to_s.length
    end
  end
end
