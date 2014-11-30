# TripleCrownQuery logic

Separating out the logic into subviews helped.

The SELECT functions as the view partial.

After that, it was taking 3 subviews and then AND'ing them together via INNER JOIN.

The views were broken into summary/groups for year, player_id, & league.

Why?
  1. A player could have multiple entries for a year.
  2. I made the decision that a players stats belong to the league & not the player.

So if a player got traded to a team on the opposite league, then his stats would start
at zero.
