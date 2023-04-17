package main
 
import (
    "os"
    "database/sql"
    "fmt"
    _ "github.com/lib/pq"
)
 
// const (
//     // host     = "172.17.0.2"
//     // port     = 5432
//     // user     = "docker"
//     // password = "docker"
//     // dbname   = "docker"
// )
 
func main() {
        // connection string
    psqlconn := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=disable", os.Getenv("IP"),os.Getenv("PORT"), os.Getenv("USER"), os.Getenv("PASSWORD"), os.Getenv("DBNAME"))
         
        // open database
    db, err := sql.Open("postgres", psqlconn)
    CheckError(err)
     
        // close database
    defer db.Close()
 
        // check db
    err = db.Ping()
    CheckError(err)
 
    fmt.Println("Connected!")
}
 
func CheckError(err error) {
    if err != nil {
        panic(err)
    }
}