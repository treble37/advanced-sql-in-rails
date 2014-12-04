class TableFormatter
  class Cell
    class UnkownColumnType < Exception; end

    class << self
      def Factory(cell, table)
        case cell
        when NilClass
          Cell::NullCell.new(cell, table)
        when String
          Cell::StringCell.new(cell, table)
        when Numeric
          Cell::NumericCell.new(cell, table)
        else
          raise UnkownColumnType, "Error: #{cell.class.name}"
        end
      end
    end
  end
end
