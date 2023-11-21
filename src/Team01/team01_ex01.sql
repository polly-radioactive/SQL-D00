insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); 
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');
WITH find_abs AS (
	-- найдем разницу между датой апдейта баланса и валюты
	SELECT 
		user_id, balance.updated,
		name AS currency_name, balance.money, 
		MIN(ABS(EXTRACT(EPOCH FROM (currency.updated - balance.updated)))) AS diff
		FROM currency
		JOIN balance ON balance.currency_id = currency.id
		GROUP BY user_id, balance.updated, currency_name, balance.money
	ORDER BY user_id
), add_rate AS (
	-- выводим курс также с разницей (в пред. запросе он не выводился :((())
	SELECT 
		user_id, balance.updated, currency.updated, money, rate_to_usd,
		MIN(ABS(EXTRACT(EPOCH FROM (currency.updated - balance.updated)))) AS diff
	FROM currency
	JOIN balance ON balance.currency_id = currency.id
	GROUP BY user_id, balance.updated, currency.updated, money, rate_to_usd
), add_total AS (
	-- сопоставляем 8 значений из столбца diff из первой таблицы со второй и считаем сумму в USD
	SELECT 
		add_rate.user_id, currency_name, (find_abs.money * rate_to_usd) AS currency_in_usd from add_rate
	JOIN find_abs ON find_abs.user_id = add_rate.user_id
	WHERE add_rate.diff IN (find_abs.diff) AND find_abs.money = add_rate.money
)
	-- джойним с юзером
SELECT 
	COALESCE ("user".name, 'not defined') AS name,
	COALESCE ("user".lastname, 'not defined') AS lastname, 
	currency_name, 
	currency_in_usd
FROM add_total
LEFT JOIN "user" ON "user".id = add_total.user_id
ORDER BY name DESC, lastname ASC, currency_name ASC;