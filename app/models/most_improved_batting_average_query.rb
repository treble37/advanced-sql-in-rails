# TODO: batting average might be a nice stored procedure as well.
<<-SQL
SELECT p.first_name,
       p.last_name,
       s1.player_id,
       MAX(s1.btg_average_10 - s1.btg_average_09) difference
FROM
(
  SELECT s.player_id,
    IFNULL(SUM(IFNULL(s.hits, 0)) / SUM(IFNULL(s.at_bats, 0)), 0) btg_average_09,
    v1.btg_average btg_average_10
  FROM statistics s
  INNER JOIN (
    SELECT player_id,
    IFNULL(SUM(IFNULL(s.hits, 0)) / SUM(IFNULL(s.at_bats, 0)), 0) btg_average
    FROM statistics s
    WHERE year = 2010 AND at_bats > 200
    GROUP BY year, player_id
  ) v1 ON (v1.player_id = s.player_id)
  WHERE s.year = 2009 AND s.at_bats > 200
  GROUP BY s.year, s.player_id
) s1
JOIN players p ON (s1.player_id = p.player_id)
GROUP BY player_id
ORDER BY difference DESC
LIMIT 1
SQL
