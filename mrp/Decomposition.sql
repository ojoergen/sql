--
-- Decomposition of Item via BOM
--


WITH 
   RECURSIVE Decomposition(ParentItem_Id, ChildItem_Id, lvl, Qty, Qty_acc) AS (
        SELECT ParentItem_Id, ChildItem_Id, 1, Qty, Qty
        FROM BOM

        UNION ALL

        SELECT  ParentItem_Id, ChildItem_Id, lvl + 1, Qty, Qty
        FROM  Decomposition
        WHERE ParentItem_Id = ChildItem_Id
)
SELECT 
        DC.ParentItem_Id
,       DC.ChildItem_Id
,       DC.lvl
,       DC.Qty
FROM ItemSource
INNER JOIN Item ON Item.ItemSourceId = ItemSource.Id
INNER JOIN Decomposition AS DC ON DC.ParentItem_Id = Item.Id
WHERE ItemSource.Source = 'FG'

