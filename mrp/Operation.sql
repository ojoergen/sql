--
-- Operation
--
CREATE TABLE IF NOT EXISTS Operation (
    Id                      INTEGER NOT NULL PRIMARY KEY
,   Item_Id                 INTEGER NOT NULL
,   Operation               INTEGER NOT NULL
,   LeadTime                DECIMAL(38,9)
,   CONSTRAINT Operation_FK01 FOREIGN KEY (Item_Id) REFERENCES Item(Id) 
,   CONSTRAINT Operation_UK01 UNIQUE  (Item_Id, Operation)   
);

CREATE TABLE IF NOT EXISTS Resource (
    Id                      INTEGER NOT NULL PRIMARY KEY
,   Name                    VARCHAR(30) NOT NULL
);

--insert into Resource (Name) VALUES('Machine 1'),('Machine 2'),('Machine 3');

CREATE TABLE if NOT EXISTS Operation_Resource (
    Id                      INTEGER NOT NULL PRIMARY KEY
,   Operation_Id            INTEGER NOT NULL
,   Resource_Id             INTEGER
,   CONSTRAINT Operation_Resource_FK01 FOREIGN KEY (Operation_Id) REFERENCES Operation(Id)
,   CONSTRAINT Operation_Resource_FK02 FOREIGN KEY (Resource_Id) REFERENCES Resource(Id)
);

