class TotalHomeRuns < ActiveRecord::Base
  self.table_name = "vw_total_home_runs"

  def read_only?
    true
  end
end
