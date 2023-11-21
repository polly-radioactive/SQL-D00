WITH 
-- находим самый актуальный курс для каждой из трех валют, выбирая из стобца updated
choose_relevant_rate AS (
	SELECT 
		id, 
		name AS currency_name, 
		rate_to_usd AS last_rate_to_usd
	FROM (
		SELECT 
			id, 
			name, 
			rate_to_usd,
			ROW_NUMBER() OVER (PARTITION BY id
			ORDER BY updated DESC) AS rn
		FROM currency) t
	WHERE rn = 1
-- объединяем суммы транзакций в таблице баланса по каждому человеку и его валюте
-- а также имя фамилию добавляем
), user_balance AS (
	SELECT
		COALESCE ("name", 'not defined') AS name,
		COALESCE (lastname, 'not defined') AS lastname,
		balance.type AS type,
		SUM(balance.money) AS volume, 
		balance.currency_id
	FROM "user"
	FULL JOIN balance ON balance.user_id = "user".id
	GROUP BY "user".name, "user".lastname, 
	balance.type, balance.currency_id
-- джойним с названием валюты и актуальным курсом
), balance_currency AS (
	SELECT 
		user_balance."name",
		lastname, 
		type,
		volume,
		COALESCE(currency_name, 'not defined') AS currency_name,
		COALESCE(last_rate_to_usd, 1) AS last_rate_to_usd
	FROM user_balance
	FULL JOIN choose_relevant_rate 
	ON choose_relevant_rate.id = user_balance.currency_id
	ORDER BY name DESC, lastname ASC, type ASC
)
-- добавляем актуально конвертированную сумму
SELECT 
	name, lastname, type, volume, currency_name, last_rate_to_usd,
	(last_rate_to_usd * volume) AS total_volume_in_usd
FROM balance_currency;