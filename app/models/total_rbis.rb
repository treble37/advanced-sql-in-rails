class TotalRbis < ActiveRecord::Base
  self.table_name = "vw_total_rbis"

  def read_only?
    true
  end
end
