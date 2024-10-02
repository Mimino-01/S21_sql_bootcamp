-- Add NOT NULL constraints
ALTER TABLE person_discounts
ALTER COLUMN person_id
SET NOT NULL,
    ALTER COLUMN pizzeria_id
SET NOT NULL,
    ALTER COLUMN discount
SET NOT NULL;
-- Add named constraints for NOT NULL
ALTER TABLE person_discounts
ADD CONSTRAINT ch_nn_person_id CHECK (person_id IS NOT NULL),
    ADD CONSTRAINT ch_nn_pizzeria_id CHECK (pizzeria_id IS NOT NULL),
    ADD CONSTRAINT ch_nn_discount CHECK (discount IS NOT NULL);
-- Set default value for discount
ALTER TABLE person_discounts
ALTER COLUMN discount
SET DEFAULT 0;
-- Add range constraint for discount
ALTER TABLE person_discounts
ADD CONSTRAINT ch_range_discount CHECK (
        discount >= 0
        AND discount <= 100
    );