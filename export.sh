#!/bin/bash

# argument of database name needed when being executed

TS=`sqlite3 $1 "SELECT tbl_name FROM sqlite_master WHERE type='table';"`

# exports each table to csv
for T in $TS; do

sqlite3 $1 <<!
.headers on
.mode csv
.output $T.csv
select * from $T
!

done
