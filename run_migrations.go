package main

import (
    "fmt"
    "log"
    "os"
	"database/sql"

    "github.com/golang-migrate/migrate/v4"
    _ "github.com/golang-migrate/migrate/v4/database/postgres"
    _ "github.com/golang-migrate/migrate/v4/source/file"
	"github.com/joho/godotenv"
)

func loadDBURL() string {
    err := godotenv.Load()
    if err != nil {
        log.Fatal("Error loading .env file")
    }

    dbUser := os.Getenv("DB_USER")
    dbPassword := os.Getenv("DB_PASSWORD")
    dbHost := os.Getenv("DB_HOST")
    dbPort := os.Getenv("DB_PORT")
    dbName := os.Getenv("DB_NAME")

    if dbUser == "" || dbPassword == "" || dbHost == "" || dbPort == "" || dbName == "" {
        log.Fatal("One or more database environment variables are missing")
    }

    return fmt.Sprintf("postgres://%s:%s@%s:%s/%s?sslmode=disable",
        dbUser, dbPassword, dbHost, dbPort, dbName)
}


func main() {
    dbURL := loadDBURL()

    db, err := sql.Open("postgres", dbURL)
    if err != nil {
        log.Fatal(err)
    }
    defer db.Close()

    exists, err := tableExists(db, "users")
    if err != nil {
        log.Fatal(err)
    }

    if exists {
        fmt.Println("Users table already exists. Skipping creation.")
    } else {
        m, err := migrate.New(
            "file://db/migrations",
            dbURL)
        if err != nil {
            log.Fatal(err)
        }

        if err := m.Up(); err != nil && err != migrate.ErrNoChange {
            log.Fatal(err)
        }

        fmt.Println("Migrations completed successfully")
    }
}

func tableExists(db *sql.DB, tableName string) (bool, error) {
    query := `
        SELECT EXISTS (
            SELECT FROM information_schema.tables 
            WHERE table_schema = 'public' 
            AND table_name = $1
        );`
    
    var exists bool
    err := db.QueryRow(query, tableName).Scan(&exists)
    if err != nil {
        return false, err
    }
    return exists, nil
}