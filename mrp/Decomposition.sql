--
-- Decomposition of Item via BOM
--


WITH 
   RECURSIVE Decomposition(ParentItem_Id, ChildItem_Id, lvl, Qty, Qty_acc) AS (
        SELECT ParentItem_Id, ChildItem_Id, 1, Qty, Qty
        FROM BOM

        UNION

        SELECT  ParentItem_Id, ChildItem_Id, lvl + 1, Qty, Qty
        FROM  Decomposition
        WHERE ParentItem_Id = ChildItem_Id
)
SELECT ParentItem_Id, ChildItem_Id, lvl 
FROM Decomposition
WHERE ParentItem_Id = 1;



