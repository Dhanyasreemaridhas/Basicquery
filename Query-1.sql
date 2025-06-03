SELECT
  name,
  sum(fours + sixes) AS number_of_boundaries
FROM
  player
GROUP BY
  name
ORDER BY
  number_of_boundaries DESC,
  name DESC;
SELECT
  name,
  max(score) AS highest_score
FROM
  PLAYER
WHERE
  cast(strftime("%Y", match_date) AS integer) = 2006
GROUP BY
  name
ORDER BY
  highest_score DESC;
SELECT
  name,
  MATCH,
  (cast(score AS float) / no_of_balls) * 100 AS strike_rate
FROM
  player
ORDER BY
  strike_rate DESC;
SELECT
  name,
  sum(score) AS total_score,
  CASE
    WHEN sum(score) >= 150 THEN "GOOD"
    WHEN sum(score) >= 100 THEN "AVERAGE"
    ELSE "BELOW AVERAGE"
  END AS badge
FROM
  player
WHERE
  cast(strftime("%Y", match_date) AS integer) = 2006
GROUP BY
  name
ORDER BY
  total_score DESC;
SELECT
  name,
  count(
    CASE
      WHEN (cast(score AS float) / no_of_balls) * 100 < 80.0 THEN 1
      ELSE NULL
    END
  ) AS strike_rate_less_than_80,
  count(
    CASE
      WHEN (cast(score AS integer) / no_of_balls) * 100 >= 80.0 THEN 1
      ELSE NULL
    END
  ) AS strike_rate_greater_than_or_equal_to_80
FROM
  player
GROUP BY
  name
ORDER BY
  name ASC;
SELECT
  DISTINCT(name)
FROM
  PLAYER
WHERE
  name = "Ravi";
SELECT
  upper(name) AS name
FROM
  player
WHERE
  played_for_team = "SRH"
EXCEPT
SELECT
  upper(name) AS name
FROM
  player
WHERE
  played_for_team <> "SRH"
ORDER BY
  name ASC;
SELECT
  name
FROM
  player
WHERE
  played_for_team = "SRH"
UNION
SELECT
  name
FROM
  player
WHERE
  played_for_team = "CSK"
UNION
SELECT
  name
FROM
  player
WHERE
  played_for_team = "MI"
ORDER BY
  name;
SELECT
  name,
  max(score) AS highest_score,
  min(score) AS lowest_score
FROM
  player
WHERE
  (cast(score AS float) / no_of_balls) * 100 > 50
GROUP BY
  name;
