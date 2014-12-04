class TableFormatter
  class Cell
    class StringCell < Base
      def value
        primative.to_s
      end

      def justify(string, amount)
        string.ljust(amount)
      end
    end
  end
end
