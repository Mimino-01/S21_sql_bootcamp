CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10) RETURNS TABLE(fibonacci integer) AS $$
DECLARE f1 integer := 0;
f2 integer := 1;
next_fib integer;
BEGIN RETURN QUERY
SELECT f1;
WHILE f2 < pstop LOOP RETURN QUERY
SELECT f2;
next_fib := f1 + f2;
f1 := f2;
f2 := next_fib;
END LOOP;
END;
$$ LANGUAGE plpgsql;