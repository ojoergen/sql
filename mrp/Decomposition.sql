--
-- Decomposition of Item via BOM
--


WITH 
   RECURSIVE Decomposition(ParentItem_Id, ChildItem_Id, lvl, Qty, Qty_acc) AS (
        SELECT BOM.ParentItem_Id, BOM.ChildItem_Id, 1, 1, 1
        FROM ItemSource
        INNER JOIN Item ON Item.ItemSourceId = ItemSource.Id
        INNER JOIN BOM ON BOM.ParentItem_Id = Item.Id
        WHERE ItemSource.Source = 'FG'


        UNION ALL

        SELECT  ParentItem_Id, ChildItem_Id, lvl + 1, Qty, Qty
        FROM  Decomposition
        WHERE ParentItem_Id = ChildItem_Id
)
SELECT 
FROM Decomposition


