class TableFormatter
  class Row
    attr_reader :cells, :table

    def initialize(cells, table)
      @table = table
      @cells = build(cells)
    end

    def render
      render_cells.join(' ')
    end

    #######
    private
    #######

    def render_cells
      cells.enum_for(:each_with_index).map { |cell,index| cell.render(index) }
    end

    def build(cells)
      cells.map { |column| Cell::Factory(column, table) }
    end
  end
end
