-- Добавляем комментарий к таблице
COMMENT ON TABLE person_discounts IS 'Эта таблица хранит персональные скидки для клиентов в определенных пиццериях';
-- Добавляем комментарии к столбцам
COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор для каждой записи о скидке';
COMMENT ON COLUMN person_discounts.person_id IS 'Внешний ключ, ссылающийся на человека, который получает скидку';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Внешний ключ, ссылающийся на пиццерию, предоставляющую скидку';
COMMENT ON COLUMN person_discounts.discount IS 'Процент скидки, применяемый к заказам для этого человека в этой пиццерии';