class TableFormatter
  class Cell
    class NullCell < Base
      def value
        'NULL'
      end

      def justify(string, amount)
        string.ljust(amount)
      end
    end
  end
end
