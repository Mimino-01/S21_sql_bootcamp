-- Создаем последовательность, начиная с 1
CREATE SEQUENCE seq_person_discounts START 1;
-- Устанавливаем текущее значение последовательности
-- равным количеству строк в таблице person_discounts плюс 1
SELECT setval(
        'seq_person_discounts',
        (
            SELECT COUNT(*)
            FROM person_discounts
        ) + 1
    );
-- Изменяем таблицу person_discounts, 
-- устанавливая значение по умолчанию для столбца id
ALTER TABLE person_discounts
ALTER COLUMN id
SET DEFAULT nextval('seq_person_discounts');