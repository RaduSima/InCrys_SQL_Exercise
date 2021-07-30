CREATE OR REPLACE FUNCTION get_med(sp_name VARCHAR, con_name VARCHAR)
	RETURNS DOUBLE PRECISION
	LANGUAGE plpgsql
AS $$
BEGIN
	RETURN (SELECT AVG(cost) FROM places
		   WHERE sport_name = sp_name AND country = con_name);
END; $$