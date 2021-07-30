CREATE TABLE sports(
	sport_id SERIAL PRIMARY KEY,
	sport_name VARCHAR(100) UNIQUE NOT NULL,
	period_start DATE NOT NULL,
	period_end DATE NOT NULL
);

INSERT INTO sports(sport_name, period_start, period_end)
VALUES
	('ski', '2000-01-01', '2100-03-01'),
	('bungee_jumping', '2000-03-01', '2100-12-01'),
	('zorbing', '2000-07-01', '2100-12-01'),
	('ice_climbing', '2000-01-01', '2100-03-01'),
	('slacklining', '2000-06-01', '2100-10-01'),
	('kitesurfing', '2000-06-01', '2100-10-01'),
	('skydiving', '2000-04-01', '2100-08-01'),
	('zip-lining', '2000-01-01', '2100-12-01'),
	('snowmobiling', '2000-02-01', '2100-04-01'),
	('coasteering', '2000-05-01', '2100-10-01');
