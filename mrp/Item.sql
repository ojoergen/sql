--
-- ItemMaster
--
CREATE TABLE IF NOT EXISTS ItemSource (
    Id                  INTEGER NOT NULL PRIMARY KEY
,   Source              VARCHAR(3) NOT NULL
);

INSERT INTO ItemSource (Source)
VALUES ('FG'),('SRC'),('ASS');

CREATE TABLE IF NOT EXISTS Item (
    Id                  INTEGER NOT NULL PRIMARY KEY
,   Name                VARCHAR(30) NOT NULL
,   SourceId            INTEGER NOT NULL
,   CONSTRAINT Item_FK01 FOREIGN KEY(SourceId) REFERENCES ItemSource(SourceId)
);
-- INSERT INTO Item(Name) values('Item 1'),('Item 2'),('Item 3'),('Item 4'),('Item 5'),('Item 6'),('Item 7'),('Item 8'),('Item 9'),('Item 10');

CREATE TABLE IF NOT EXISTS Location (
    Id                  INTEGER NOT NULL PRIMARY KEY
,   Name                VARCHAR(30) NOT NULL
,   Capacity            DECIMAL(38,9)
,   Warehouse_Id        INTEGER NOT NULL
);

INSERT into Location (Name,Capacity,Warehouse_Id) values('Loc 1',2938.345,1),('Loc 2',383338.345,1);

CREATE TABLE IF NOT EXISTS Item_Stock (
    Id                  INTEGER NOT NULL PRIMARY KEY
,   Item_Id             INTEGER NOT NULL
,   Location_Id         INTEGER NOT NULL
,   Qty                 DECIMAL(38,9)
,   CONSTRAINT Item_Stock_FK01 FOREIGN KEY (Item_Id) REFERENCES Item(Id)
,   CONSTRAINT Item_Stock_FK02 FOREIGN KEY (Location_Id) REFERENCES Location(Id)
,   CONSTRAINT Item_Stock_UK01 UNIQUE (Item_Id, Location_Id)
);

--INSERT into Item_Stock (Item_Id,Location_Id,Qty) values(1,1,323.292837378),(1,2,3239383.22937378);