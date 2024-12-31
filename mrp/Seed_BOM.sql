WITH RECURSIVE tree(i,j,k) AS (
    SELECT 1, 21, 0

    UNION ALL

    SELECT i, i*20+k, k+1
    FROM tree
)
select * from tree limit 20;

select x.Id,z.Id
from Item x
inner join Item z on z.Id = x.Id*20+1 
where x.Id <= 20;

/*
    1,21    i, i*20+1
    1,22    1, i*20+2
    1,23
    1,24
    ...
    1,30    i, i*20+10

    2,31    i, i*15+1
    2,32    i, i*15+2
    ...
    20,

    21,210
    21,211
    ...
    22,220
    22,221
    ...
    210,2100
*/