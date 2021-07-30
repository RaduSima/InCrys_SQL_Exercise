SELECT country, COUNT(DISTINCT(sport_name)) FROM places
GROUP BY country
ORDER BY COUNT(DISTINCT(sport_name)), country