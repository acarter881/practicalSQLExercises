/*
QUESTION:
Using either the median() or percentile_cont() functions in
Chapter 5, determine the median of the percent change in
county population.
*/

SELECT 
	percentile_cont(0.50) WITHIN GROUP (ORDER BY ROUND((CAST(c2010.p0010001 AS NUMERIC(8,1)) - c2000.p0010001) / c2000.p0010001 * 100, 1)) AS median_percentile
FROM 
	us_counties_2010 c2010 
INNER JOIN 
	us_counties_2000 c2000
	ON c2010.state_fips = c2000.state_fips
	AND c2010.county_fips = c2000.county_fips
	AND c2010.p0010001 <> c2000.p0010001;
