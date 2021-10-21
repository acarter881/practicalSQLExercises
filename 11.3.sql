/*
QUESTION:
1. Calculate the correlation coefficient and r-squared values
using trip time and the total_amount column in the New York
City taxi data.

2. Do the same with the trip_distance and total_amount
columns. 

3. Limit the query to rides that last three hours or less.
*/

SELECT
	round(corr(total_amount, trip_distance)::numeric, 2) AS corr_amount_distance,
	round(regr_r2(total_amount, trip_distance)::numeric, 2) AS r_squared_amount_distance
FROM
	nyc_yellow_taxi_trips_2016_06_01
WHERE
	(tpep_dropoff_datetime - tpep_pickup_datetime) <= '3 hours';

SELECT
	round(corr(total_amount, trip_time)::numeric, 2) AS corr_amount_time,
	round(regr_r2(total_amount, trip_time)::numeric, 2) AS r_squared_amount_time
FROM(
	SELECT
		round(EXTRACT(epoch from (tpep_dropoff_datetime - tpep_pickup_datetime))::numeric / 3600, 2) AS trip_time,
		total_amount
	FROM
		nyc_yellow_taxi_trips_2016_06_01
	WHERE
		(tpep_dropoff_datetime - tpep_pickup_datetime) <= '3 hours'
	) AS a;
