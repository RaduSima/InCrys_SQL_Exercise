CREATE OR REPLACE FUNCTION get_sports(loc VARCHAR, mon DOUBLE PRECISION)
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
		SELECT sports.sport_id, sports.sport_name, places.place_id, places.country, places.city,
			   places.place_name, places.address, sports.period_start, sports.period_end, places.cost
		FROM places
		INNER JOIN sports
		ON places.sport_name = sports.sport_name
		WHERE (places.country = loc OR places.city = loc OR places.place_name = loc OR places.address = loc)
		AND mon BETWEEN EXTRACT(MONTH FROM sports.period_start) AND EXTRACT(MONTH FROM sports.period_end)
		ORDER BY place_id;
		
END; $$