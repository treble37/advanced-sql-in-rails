# todo: consider trying a stored procedure, just for the fuck of it.
<<-SQL.squish
  select p.first_name, p.last_name, IFNULL(hits, 0) hits, IFNULL(doubles, 0) doubles, IFNULL(triples, 0) triples,
  IFNULL(home_runs, 0) home_runs, IFNULL(at_bats, 0) at_bats, team, year,
  (((hits - doubles - triples - home_runs) + (2 * doubles) + (3 * triples) + (4 * home_runs)) / at_bats) slugging_percentage
  from statistics s
  join players p on(p.player_id = s.player_id)
  where team = 'OAK'
  and year = 2007;
SQL
