class TableFormatter
  class TransposedRow
    attr_reader :row

    def initialize(row)
      @row = row
    end

    def max_width
      row.max { |a,b| a.to_s.length <=> b.to_s.length }.to_s.length
    end
  end
end
