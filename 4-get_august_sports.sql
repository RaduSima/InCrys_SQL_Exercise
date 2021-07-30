CREATE OR REPLACE FUNCTION get_august_sports(sp_name VARCHAR, con_name VARCHAR)
	RETURNS TABLE(
		sport_id INTEGER,
		sport_name VARCHAR,
		place_id INTEGER,
		country VARCHAR,
		city VARCHAR,
		place_name VARCHAR,
		address VARCHAR,
		period_start DATE,
		period_end DATE,
		cost DOUBLE PRECISION
	)
	LANGUAGE plpgsql
AS $$
BEGIN
	RETURN QUERY
		SELECT sports.sport_id, sports.sport_name, places.place_id, places.country, 
          	   places.city, places.place_name, places.address, sports.period_start, sports.period_end, places.cost
		FROM sports
		INNER JOIN places
		ON sports.sport_name = places.sport_name
		WHERE places.sport_name = sp_name
		AND places.country = con_name
		AND 8 BETWEEN EXTRACT(MONTH FROM sports.period_start) AND EXTRACT(MONTH FROM sports.period_end)
		AND EXTRACT(MONTH FROM sports.period_start) >= 1 and EXTRACT(MONTH FROM sports.period_end) <= 10
		ORDER BY sport_id, place_id;
		
END; $$