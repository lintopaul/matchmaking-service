package models

import (
	"database/sql/driver"
	"encoding/json"
	"errors"
	"time"

	"github.com/lib/pq"
)

type User struct {
    UserID     uint      `gorm:"primaryKey;column:user_id" json:"user_id"`
    Name       string    `json:"name"`
    Age        int       `json:"age"`
    Gender     string    `json:"gender"`
    Latitude   float64   `json:"latitude"`
    Longitude  float64   `json:"longitude"`
    Interests  pq.StringArray  `gorm:"type:text[]" json:"interests"`
    Preferences PreferencesJSON `gorm:"type:jsonb" json:"preferences"`
    LastActive time.Time `json:"last_active"`
}

type PreferencesJSON Preferences

type Preferences struct {
    MinAge     int    `json:"min_age"`
    MaxAge     int    `json:"max_age"`
    Gender     string `json:"gender"`
    MaxDistance float64 `json:"max_distance"`
}

func (p *PreferencesJSON) Scan(value interface{}) error {
    bytes, ok := value.([]byte)
    if !ok {
        return errors.New("type assertion to []byte failed")
    }

    return json.Unmarshal(bytes, &p)
}

func (p PreferencesJSON) Value() (driver.Value, error) {
    return json.Marshal(p)
}