#!/usr/bin/env bash
touch test.go

echo "package main
 
import (
    \"database/sql\"
    \"fmt\"
    _ \"github.com/lib/pq\"
)
 
const (
    host     = \"$HOST\"
    port     = $PORT
    user     = \"$USER\"
    password = \"$PASSWORD\"
    dbname   = \"$DBNAME\"
)
 
func main() {
        // connection string
    psqlconn := fmt.Sprintf(\"host=%s port=%d user=%s password=%s dbname=%s sslmode=disable\", host, port, user, password, dbname)
         
        // open database
    db, err := sql.Open(\"postgres\", psqlconn)
    CheckError(err)
     
        // close database
    defer db.Close()
 
        // check db
    err = db.Ping()
    CheckError(err)
 
    fmt.Println(\"Connected!\")
}
 
func CheckError(err error) {
    if err != nil {
        panic(err)
    }
}" > test.go

go env -w GO111MODULE=off

go get github.com/lib/pq

go run test.go > /go/logs/log.txt

bash