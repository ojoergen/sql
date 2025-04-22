WITH RECURSIVE cnt (n) AS (
    SELECT 1
    UNION ALL
    SELECT n+1
    FROM cnt
    LIMIT 10000
)
INSERT INTO Item(Id, Name, SourceId)
SELECT n
, format('Item %05d', n)
, CASE
    WHEN n <= 100 THEN (SELECT Id FROM ItemSource WHERE Source='FG')
    WHEN n <= 7000 THEN (SELECT Id FROM ItemSource WHERE Source='ASS')
    ELSE (SELECT Id FROM ItemSource WHERE Source='SRC')
  END
FROM cnt;
