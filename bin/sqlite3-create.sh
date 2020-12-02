#!/bin/sh

TBL_NAME="person"
OUT_FILE="./${TBL_NAME}.db"

rm -f ${OUT_FILE}

sqlite3 ${OUT_FILE} <<'END_SQL'
CREATE TABLE IF NOT EXISTS age ( 
    ageId INTEGER PRIMARY KEY AUTOINCREMENT, 
    edad int NOT NULL
);
CREATE TABLE IF NOT EXISTS person ( 
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name varchar(10) NOT NULL,
    ageId int NOT NULL
);
INSERT INTO person (name, ageId) VALUES
('Adam', 1), ('Bob', 2), ('Carl', 1)
, ('Dale', 2), ('Ed', 1), ('Fred', 2);
INSERT INTO age (edad) VALUES (25), (31);
.table
.header ON
.mode column
SELECT p.id, p.name, a.edad FROM person AS p
JOIN age AS a ON p.ageId = a.ageId;
END_SQL

# Credit https://unix.stackexchange.com/questions/414443/how-to-write-sqlite-commands-in-a-shell-script
