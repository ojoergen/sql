--
--
--
CREATE TABLE if NOT EXISTS Salesorder (
    Id                      INTEGER NOT NULL PRIMARY KEY
,   SalesOrderNumber        VARCHAR(16) NOT NULL
,   Item_Id                 INTEGER NOT NULL
,   Qty                     DECIMAL(38,9)
,   ShipDate                DATE NOT NULL
,   CONSTRAINT Salesorder_FK01 FOREIGN KEY (Item_Id) REFERENCES Item(Id)
);

INSERT INTO Salesorder (SalesOrderNumber,Item_Id,Qty,ShipDate) 
    VALUES('F023931',   1, 100,  unixepoch('now', 'utc', '+5 MONTHS') )--strftime('%s', 'now', 'utc', '5 MONTHS') )
    ,     ('F001331-0', 1, 200,  unixepoch('now', 'utc', '+6 MONTHS') )
    ,     ('F099222',   1, 1350, unixepoch('now', 'utc', '+7 MONTHS') )
;
