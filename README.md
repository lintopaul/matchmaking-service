# Matchmaking Service

## Overview

The Matchmaking Service is a robust, scalable backend solution designed to power modern dating and social networking applications. Built with Go and leveraging PostgreSQL, this service provides a sophisticated API for generating personalized match recommendations based on user preferences, location, and shared interests.

## Key Features

- **Smart Matching Algorithm**: Utilizes user preferences, location data, and shared interests to generate highly relevant match recommendations.
- **Efficient Data Management**: Employs PostgreSQL for reliable and efficient data storage and retrieval.
- **RESTful API**: Offers a clean, well-documented API for easy integration with frontend applications.
- **Scalable Architecture**: Designed with performance and scalability in mind to handle growing user bases.
- **Customizable Preferences**: Allows users to set detailed preferences for potential matches, including age range, gender, and maximum distance.
- **Interest-Based Matching**: Considers shared interests to enhance the quality of matches.
- **Pagination Support**: Implements efficient pagination for handling large datasets of potential matches.

## Technical Stack

- **Backend**: Go 1.23.1
- **Database**: PostgreSQL 16+
- **ORM**: GORM
- **API Framework**: Gin
- **Migration Tool**: golang-migrate

## Setup

Create a `.env` file in the project root and add your database credentials:
```
DB_USER=<your_db_user>
DB_PASSWORD=<your_db_password>
DB_HOST=<hostname>
DB_PORT=5432
DB_NAME=<matchmaking_db>
```

## API Documentation

### Get Match Recommendations

Retrieves a list of potential matches for a user based on preferences and interests.

- **URL**: `/api/match/recommendations`
- **Method**: `GET`
- **URL Params**:
- `user_id` (required): The ID of the user requesting recommendations
- `page` (optional): Page number for pagination (default: 1)
- `page_size` (optional): Number of results per page (default: 10)

#### Sample Request
```
curl -X GET "http://localhost:8080/api/match/recommendations?user_id=1&page=1&page_size=10"
```

#### Success Response

- **Code**: 200 OK
- **Content**:
```json
[
 {
   "user_id": 2,
   "name": "Jane Smith",
   "age": 25,
   "gender": "Female",
   "latitude": 34.0522,
   "longitude": -118.2437,
   "interests": ["art", "travel"],
   "preferences": {
     "min_age": 21,
     "max_age": 30,
     "gender": "Male",
     "max_distance": 30
   },
   "last_active": "2024-09-13T11:00:00Z"
 },
 // ... more user objects
]
```

## RUN
To run the containerized app:-
```
docker-compose up
```

## Populate Data

```
migrate create -ext sql -dir db/migrations -seq insert_sample_data
```
This will create two new files in your db/migrations directory:
NNNNNN_insert_sample_data.up.sql
NNNNNN_insert_sample_data.down.sql

OPEN THE SQL file and add the necessary SQL statements for adding data and deleting data in the up and down files respectively.

To populate data, run:-
```
make migrate-up
```

To delete data, run:-
```
make migrate-down
```

## TODO
To optimize performance:-
- Add appropriate indexes to the database (e.g., on age, gender, last_active).
- Implement caching for frequently accessed data.
- Use database functions for complex calculations like distance.
- Handle error cases, implement proper logging, and add unit tests for the services and handlers.