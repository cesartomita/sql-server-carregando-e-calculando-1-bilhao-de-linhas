USE ONE_BILLION_CHALLENGE;

SELECT
	measurements
FROM
	measurements_oledb
WHERE
	station_name = 'Chicago';

SELECT
	COUNT(*)
FROM
	measurements_oledb;

SELECT
	station_name,
	MIN(measurements) AS [min],
	AVG(measurements) AS [avg],
	MAX(measurements) AS [max]
FROM
	measurements_oledb
GROUP BY
	station_name;