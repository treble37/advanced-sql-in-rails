class TableFormatter
  class Row
    attr_reader :row, :transposed_table

    def initialize(row, transposed_table)
      @transposed_table = transposed_table
      @row              = build(row)
    end

    def render
      _render.join(' ')
    end

    #######
    private
    #######

    def _render
      row.enum_for(:each_with_index).map { |col,index| col.render(index) }
    end

    def build(row)
      row.map { |column| Column.new(column, transposed_table) }
    end
  end
end
