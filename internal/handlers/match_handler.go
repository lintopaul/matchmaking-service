package handlers

import (
	"net/http"
	"strconv"

	"matchmaking-service/internal/services"

	"github.com/gin-gonic/gin"
)

type MatchHandler struct {
    matchService *services.MatchService
}

func NewMatchHandler(matchService *services.MatchService) *MatchHandler {
    return &MatchHandler{matchService: matchService}
}

func (h *MatchHandler) GetRecommendations(c *gin.Context) {
    userID, _ := strconv.Atoi(c.Query("user_id"))
    page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
    pageSize, _ := strconv.Atoi(c.DefaultQuery("page_size", "10"))

    matches, err := h.matchService.GetRecommendations(uint(userID), page, pageSize)
    if err != nil {
        c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
        return
    }

    c.JSON(http.StatusOK, matches)
}