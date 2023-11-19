SELECT
    address,
    round(MAX(age) - (CAST(MIN(age) AS NUMERIC) / MAX(age)), 2) AS formula,
    round(AVG(age), 2) AS average,
    MAX(age) - (MIN(age) / MAX(age)) > AVG(age) AS comparison
FROM person
GROUP BY address
ORDER BY address;
