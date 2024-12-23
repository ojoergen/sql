--
--
--
CREATE TABLE if NOT EXISTS Salesorder (
    Id                      INTEGER NOT NULL PRIMARY KEY
,   SalesOrderNumber        VARCHAR(16) NOT NULL
,   Displacement_Id         INTEGER NOT NULL
,   ShipDate                DATE NOT NULL
--,   CONSTRAINT Salesorder_FK01 FOREIGN KEY (Item_Id) REFERENCES Item(Id)
,   CONSTRAINT Salesorder_FK02 FOREIGN KEY (Displacement_Id) REFERENCES Displacement(Id)
);

-- INSERT INTO Salesorder (Item_id,Qty,ShipDate) 
--     values(1,100,strftime('%s', 'now', 'utc', '5 MONTHS') )
--     ,(1,100,strftime('%s', 'now', 'utc', '6 MONTHS') )
--     ,(1,100,strftime('%s', 'now', 'utc', '7 MONTHS') )
-- ;
