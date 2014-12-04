class TableFormatter
  class Cell
    WIDTH = 8

    attr_reader :primative, :table

    def initialize(primative, table)
      @table     = table
      @primative = primative
    end

    def appropriate_width_for(column_index)
      table.appropriate_width_for(column_index)
    end

    def render(column_index)
      justify(build, appropriate_width_for(column_index))
    end

    def build
      justify(value, WIDTH)
    end

    def justify(string, amount)
      string.ljust(amount)
    end

    def value
      (primative || 'NULL').to_s
    end
  end
end
