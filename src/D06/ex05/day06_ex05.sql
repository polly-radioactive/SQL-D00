COMMENT ON TABLE person_discounts IS 'table of personal discounts, depends on the number of orders in the pizzeria';
COMMENT ON COLUMN person_discounts.id IS 'id, primary key';
COMMENT ON COLUMN person_discounts.person_id IS 'person id in person table, foreign key';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'pizzeria id in pizzeria table, foreign key';
COMMENT ON COLUMN person_discounts.discount IS 'value of personal discount in percents, 0-100';