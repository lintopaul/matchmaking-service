CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    age INT NOT NULL,
    gender VARCHAR(10),
    latitude FLOAT,
    longitude FLOAT,
    interests TEXT[],
    preferences JSONB,
    last_active TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);