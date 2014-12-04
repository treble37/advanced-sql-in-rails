class TripleCrownQuery

  class TripleCrownWinner
    extend Forwardable

    def_delegators :@winner, :first_name, :last_name, :year, :league

    def initialize(winner)
      @winner = winner
    end

    def winner?
      @winner
    end

    def results
      if winner?
        winner_message
      else
        no_winner_message
      end
    end

    def winner_message
      "#{year} #{league} Triple Crown Winner: #{first_name.capitalize} #{last_name.capitalize}"
    end

    def no_winner_message
      "(No Winner)"
    end
  end

  attr_reader :year, :league, :ctx
  attr_accessor :result_of_query

  def initialize(year, league, ctx)
    @year    = year
    @league  = league
    @ctx     = ctx # change to connection ?
  end

  def execute
    run_query
    prepare_results
  end

  def run_query
    self.result_of_query = ctx.find_by_sql(triple_crown_winner_query)
  end

  def prepare_results
    TripleCrownWinner.new(result_of_query.first).results
  end

  def triple_crown_winner_query
    <<-SQL.squish
      SELECT p.last_name, p.first_name, s.year, s.league FROM statistics s
      INNER JOIN (
        SELECT player_id, year, league
        FROM vw_total_home_runs
        WHERE total_home_runs = (
          SELECT MAX(total_home_runs)
          FROM vw_total_home_runs
          WHERE year = '#{year}' AND league = '#{league}'
        )
      ) v1 ON (s.player_id = v1.player_id AND s.year = v1.year AND v1.league = s.league)
      INNER JOIN (
        SELECT player_id, year, league
        FROM vw_total_batting_averages
        WHERE total_btg_avg = (
          SELECT MAX(total_btg_avg)
          FROM vw_total_batting_averages
          WHERE year = '#{year}' AND league = '#{league}'
        )
      ) v2 ON (s.player_id = v2.player_id AND s.year = v2.year AND v2.league = s.league)
      INNER JOIN (
        SELECT player_id, year, league
        FROM vw_total_rbis
        WHERE total_rbis = (
          SELECT MAX(total_rbis)
          FROM vw_total_rbis
          WHERE year = '#{year}' AND league = '#{league}'
        )
      ) v3 ON (s.player_id = v3.player_id AND s.year = v3.year AND v3.league = s.league)
      JOIN players p ON (p.player_id = s.player_id)
    SQL
  end
end
