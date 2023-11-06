SELECT missing_day AS missing_date
FROM GENERATE_SERIES('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS missing_day
LEFT JOIN person_visits ON missing_day = person_visits.visit_date AND person_id IN (1, 2)
WHERE person_visits.visit_date IS NULL
ORDER BY missing_day ASC;