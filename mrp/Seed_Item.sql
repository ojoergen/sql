WITH RECURSIVE cnt (n) AS (
    SELECT 1
    UNION ALL
    SELECT n+1
    FROM cnt
    LIMIT 10000
)
INSERT INTO Item(Id, Name)
SELECT n, format('Item %05d', n)
FROM cnt;
