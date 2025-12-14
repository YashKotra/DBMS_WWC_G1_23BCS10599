CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
    IF N < 1 THEN
        RETURN QUERY SELECT NULL::INT;
        RETURN;
    END IF;

  RETURN QUERY (
    SELECT s.salary
    FROM (
      SELECT DISTINCT e.salary
      FROM Employee e
      ORDER BY salary DESC
    ) AS s
    LIMIT 1 OFFSET N - 1
  );
END;
$$ LANGUAGE plpgsql;

-- G1_23BCS10599_Yash Kotra_SESSION1
