SELECT
	test_date AT TIME ZONE 'America/New_York' AS "New York City",
	test_date AT TIME ZONE 'Europe/London' AS "London",
	test_date AT TIME ZONE 'Africa/Johannesburg' AS "Johannesburg",
	test_date AT TIME ZONE 'Europe/Moscow' AS "Moscow",
	test_date AT TIME ZONE 'Australia/Melbourne' AS "Melbourne"
FROM
	time_zone_test;
