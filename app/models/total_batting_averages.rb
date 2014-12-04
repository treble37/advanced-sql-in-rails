# https://rietta.com/blog/2013/11/28/rails-and-sql-views-for-a-report/
class TotalBattingAverages < ActiveRecord::Base
  self.table_name = "vw_total_batting_averages"

  def read_only?
    true
  end
end
