--
-- BOM
--
CREATE TABLE IF NOT EXISTS BOM (
    Id                      INTEGER NOT NULL PRIMARY KEY
 ,  ParentItem_Id           INTEGER NOT NULL
 ,  ChildItem_Id            INTEGER NOT NULL
 ,  Qty                     DECIMAL(38,9)
 ,  CONSTRAINT BOM_FK01 FOREIGN KEY (ParentItem_Id) REFERENCES Item (Id)   
 ,  CONSTRAINT BOM_FK02 FOREIGN KEY (ChildItem_Id) REFERENCES Item (Id)   
 ,  CONSTRAINT BOM_UK01 UNIQUE (ParentItem_Id, ChildItem_Id)
);

-- insert into BOM (ParentItem_Id,ChildItem_Id,Qty) values(1,2,2.4),(1,3,0.0009);
-- insert into BOM (ParentItem_Id,ChildItem_Id,Qty) values(2,4,2.4);
-- insert into BOM (ParentItem_Id,ChildItem_Id,Qty) values(4,5,2.555);

