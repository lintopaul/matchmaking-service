package services

import (
	"matchmaking-service/internal/database"
	"matchmaking-service/internal/models"
)

type MatchService struct{}

func (s *MatchService) GetRecommendations(userID uint, page, pageSize int) ([]models.User, error) {
    var user models.User
    if err := database.DB.First(&user, userID).Error; err != nil {
        return nil, err
    }

    var matches []models.User
	// database.DB.Preload("Preferences").First(&matches, userID)
    query := database.DB.Model(&models.User{}).
        Where("user_id != ?", userID).
        Where("gender = ?", user.Preferences.Gender).
        Where("age BETWEEN ? AND ?", user.Preferences.MinAge, user.Preferences.MaxAge).
        // Add distance calculation and filtering here
        Order("last_active DESC")

    if err := query.Offset((page - 1) * pageSize).Limit(pageSize).Find(&matches).Error; err != nil {
        return nil, err
    }

    return matches, nil
}