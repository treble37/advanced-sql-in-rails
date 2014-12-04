class TableFormatter
  class Column
    WIDTH = 8

    attr_reader :column, :transposed_table

    def initialize(column, transposed_table)
      @transposed_table = transposed_table
      @column           = cleanse(column)
    end

    def render(column_index)
      column.to_s.ljust(appropriate_width_for(column_index))
    end

    def appropriate_width_for(column_index)
      transposed_table.appropriate_width_for(column_index)
    end

    #######
    private
    #######

    def cleanse(column)
      (column || 'NULL').to_s.ljust(WIDTH)
    end
  end
end
