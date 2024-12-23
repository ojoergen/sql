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
,   CONSTRAINT Displacement_FK01 FOREIGN KEY (Item_Id) REFERENCES Item(Id)
,   CONSTRAINT Displacement_FK02 FOREIGN KEY (DisplacementKind_Id) REFERENCES DisplacementKind(Id)
);

INSERT INTO Displacement(Item_Id, DisplacementKind_Id, Qty, EffectiveDate) VALUES(1, 4, -19288.0, strftime('%s', 'now', 'utc', '5 MONTHS'));