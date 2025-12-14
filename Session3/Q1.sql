SELECT s.user_id, ROUND(COALESCE(temp.rate, 0.00), 2) AS confirmation_rate
FROM Signups AS s
LEFT JOIN (
    SELECT user_id, SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(*) AS rate
    FROM Confirmations
    GROUP BY user_id
) AS temp
ON s.user_id = temp.user_id
ORDER BY confirmation_rate;

-- G1_23BCS80342_Tarun_Session3