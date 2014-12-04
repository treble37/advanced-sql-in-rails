class SluggingPercentage
  extend Forwardable

  def_delegators :@result, :year, :team, :last_name, :first_name, :slugging_percentage

  def initialize(result)
    @result = result
  end

  def render
    "#{year} #{team}: #{last_name}, #{first_name} - #{slugging_percentage}"
  end
end
