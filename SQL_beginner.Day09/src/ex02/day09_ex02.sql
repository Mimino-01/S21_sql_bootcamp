-- Шаг 1: Создание триггерной функции для аудита DELETE
CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS $$ BEGIN
INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
VALUES (
        'D',
        OLD.id,
        OLD.name,
        OLD.age,
        OLD.gender,
        OLD.address
    );
RETURN OLD;
END;
$$ LANGUAGE plpgsql;
-- Шаг 2: Создание триггера для аудита DELETE
CREATE TRIGGER trg_person_delete_audit
AFTER DELETE ON person FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();
-- Шаг 3: Применение DELETE-запроса
DELETE FROM person
WHERE id = 10;