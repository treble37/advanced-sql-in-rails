# https://rietta.com/blog/2013/11/28/rails-and-sql-views-for-a-report/
class VwTotalHomeRuns < ActiveRecord::Base
  def read_only?
    true
  end
end
