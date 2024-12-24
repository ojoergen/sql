--
--
--
CREATE TABLE IF NOT EXISTS DisplacementKind (
    Id                      INTEGER NOT NULL PRIMARY KEY
,   DisplacementKind        VARCHAR(30) not NULL
);

INSERT INTO DisplacementKind (DisplacementKind) VALUES('SALES');
INSERT INTO DisplacementKind (DisplacementKind) VALUES('SOURCING');
INSERT INTO DisplacementKind (DisplacementKind) VALUES('PRODUCTION');
INSERT INTO DisplacementKind (DisplacementKind) VALUES('PULL');


-- SALES displacement qty N creates qty N PRODUCTION displacement prior
CREATE TABLE if NOT EXISTS Displacement (
    Id                      INTEGER NOT NULL PRIMARY KEY
,   Item_Id                 INTEGER NOT NULL
,   DisplacementKind_Id     INTEGER NOT NULL                    
,   Qty                     DECIMAL(38,9)
,   EffectiveDate           DATE NOT NULL
,   Salesorder_Id           INTEGER NULL -- date(EffectiveDate,'unixepoch'), unixepoch('now', 'utc', '+5 MONTHS')
,   CONSTRAINT Displacement_FK01 FOREIGN KEY (Item_Id) REFERENCES Item(Id)
,   CONSTRAINT Displacement_FK02 FOREIGN KEY (DisplacementKind_Id) REFERENCES DisplacementKind(Id)
,   CONSTRAINT Displacement_FK03 FOREIGN KEY (Salesorder_Id) REFERENCES Salesorder(Id)
);

INSERT INTO Displacement(Item_Id, DisplacementKind_Id, Qty, EffectiveDate, Salesorder_Id) 
    VALUES(1, 1, -100, unixepoch('now', 'utc', '+5 MONTHS'), 1)
    ,   (1, 1, -200, unixepoch('now', 'utc', '+6 MONTHS'), 2)
    ,   (1, 1, -1350, unixepoch('now', 'utc', '+7 MONTHS'), 3)
    ,   (9, 2, 1350, unixepoch('now', 'utc', '+7 MONTHS'), NULL)
    ;

select
    Displacement.Id
,   DisplacementKind.DisplacementKind
,   date(Displacement.EffectiveDate,'unixepoch') as EffectiveDate
,   SalesOrder.Id
,   SalesOrder.SalesOrderNumber
,   date(SalesOrder.ShipDate, 'unixepoch') as Shipdate
from Displacement
inner join DisplacementKind on DisplacementKind.Id = Displacement.DisplacementKind_Id
left join SalesOrder on SalesOrder.Id = Displacement.Salesorder_Id
