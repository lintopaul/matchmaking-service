package main

import (
    "log"

    "github.com/gin-gonic/gin"
    "matchmaking-service/config"
    "matchmaking-service/internal/database"
    "matchmaking-service/internal/handlers"
    "matchmaking-service/internal/services"
)

func main() {
    cfg := config.LoadConfig()
    database.InitDB(cfg)

    r := gin.Default()

    matchService := &services.MatchService{}
    matchHandler := handlers.NewMatchHandler(matchService)

    r.GET("/api/match/recommendations", matchHandler.GetRecommendations)

    if err := r.Run(":8080"); err != nil {
        log.Fatalf("Failed to start server: %v", err)
    }
}