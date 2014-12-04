class MostImprovedBattingAverage
  attr_reader :st, :pl
  attr_reader :from, :to, :min_at_bats

  def initialize(from, to, min_at_bats)
    @from, @to, @min_at_bats = from, to, min_at_bats

    @st = Statistics.arel_table
    @pl = Player.arel_table
  end

  def to_sql
    (@to_sql ||= _to_sql).to_sql
  end

  def s1
    @s1 ||= _s1
  end

  def v1
    @v1 ||= _v1
  end

  #######
  private
  #######

  def _to_sql
    st.project(
      pl[:first_name], pl[:last_name], s1[:player_id],
      Arel::Nodes::Max.new([
        s1[:btg_average_to] - s1[:btg_average_from]
      ]).as('difference')
    ).from(
      s1
    ).join(
      pl
    ).on(
      s1[:player_id].eq(pl[:player_id])
    ).group(
      s1[:player_id]
    ).order(
      "difference desc" # how to arelize this...
    ).take(
      1
    )
  end

  def _s1
    st.project(
      st[:player_id],
      batting_average('statistics').as('btg_average_from'),
      v1[:btg_average].as('btg_average_to')
    ).from(
      st
    ).join(
      v1
    ).on(
      v1[:player_id].eq(st[:player_id])
    ).where(
      st[:year].eq(from).and(st[:at_bats].gt(min_at_bats))
    ).group(
      st[:year], st[:player_id]
    ).as('s1')
  end

  def _v1
    st.project(
      st[:player_id],
      batting_average('statistics').as('btg_average')
    ).where(
      st[:year].eq(to).and(st[:at_bats].gt(min_at_bats))
    ).group(
      st[:year], st[:player_id]
    ).as('v1')
  end

  # need to figure out how to arelize this...
  def batting_average(table)
    Arel.sql(
      <<-SQL.squish
        IFNULL(
          SUM( IFNULL(#{table}.hits, 0) ) / SUM( IFNULL(#{table}.at_bats, 0)),
        0)
      SQL
    )
  end
end
