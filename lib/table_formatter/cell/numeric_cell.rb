class TableFormatter
  class Cell
    class NumericCell < Base
      def value
        primative.to_s
      end

      def justify(string, amount)
        string.rjust(amount)
      end
    end
  end
end
