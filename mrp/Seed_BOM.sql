-- insert into BOM (ParentItem_Id, ChildItem_Id, Qty)
select x.Id, x.Id * 10 + z.Id +  10, 1
from Item x
cross join (
    select Id
    from Item
    where Id between 1 and 10
) z
where x.Id <= 20;
--order by 1,2;

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