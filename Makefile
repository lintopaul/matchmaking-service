# Load Database connection details
include .env
export

# Construct the DATABASE_URL
DATABASE_URL := postgres://$(DB_USER):$(DB_PASSWORD)@$(DB_HOST):$(DB_PORT)/$(DB_NAME)?sslmode=disable

.PHONY: migrate-up migrate-down

migrate-up:
	DATABASE_URL="$(DATABASE_URL)" go run run_migrations.go

migrate-down:
	migrate -path db/migrations -database "$(DATABASE_URL)" down

# Print the DATABASE_URL (for debugging)
print-db-url:
	@echo "DATABASE_URL: $(DATABASE_URL)"