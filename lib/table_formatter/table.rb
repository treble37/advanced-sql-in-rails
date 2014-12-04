class TableFormatter
  class Table
    attr_reader :rows, :columns

    def initialize(rows)
      @columns = Columns::BuildFrom(rows)
      @rows    = build(rows)
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

    def build(rows)
      rows.map { |row| Row.new(row, self) }
    end
  end
end
