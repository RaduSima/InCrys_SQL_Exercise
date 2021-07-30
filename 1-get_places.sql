CREATE OR REPLACE FUNCTION get_places(sp_name VARCHAR)
	RETURNS TABLE(
		place_id INTEGER,
		country VARCHAR,
		city VARCHAR,
		place_name VARCHAR,
		address VARCHAR,
		sport_name VARCHAR,
		cost DOUBLE PRECISION
	)
	LANGUAGE plpgsql
AS $$
BEGIN
	RETURN QUERY
		SELECT places.place_id, places.country, places.city, places.place_name, places.address, places.sport_name, places.cost FROM PLACES
		WHERE places.sport_name = sp_name;
END; $$