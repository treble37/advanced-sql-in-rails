class TableFormatter
  class Cell
    class Base
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
        justify(value, default_width)
      end

      def default_width
        8
      end
    end
  end
end
