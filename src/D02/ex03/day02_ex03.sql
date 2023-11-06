WITH all_days AS (
	SELECT missing_day
    FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) missing_day
	LEFT JOIN person_visits ON missing_day = person_visits.visit_date AND person_id IN (1, 2)
	WHERE person_visits.visit_date IS NULL
)
SELECT missing_day AS missing_date
FROM all_days
ORDER BY missing_day ASC;