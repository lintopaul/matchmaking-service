# Build stage
FROM golang:1.23.1-alpine AS builder

WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy source code
COPY . .

# Build the application
RUN go build -o matchmaking-service ./cmd

# Final stage
FROM alpine:3.18

RUN apk --no-cache add ca-certificates

WORKDIR /root/

# Copy the binary from builder
COPY --from=builder /app/matchmaking-service .

# Expose port 8080
EXPOSE 8080

# Command to run the application
CMD ["./matchmaking-service"]


