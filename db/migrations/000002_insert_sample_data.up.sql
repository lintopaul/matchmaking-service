INSERT INTO users (name, age, gender, latitude, longitude, interests, preferences, last_active) 
VALUES 
('John Doe', 28, 'Male', 40.7128, -74.0060, ARRAY['sports', 'music'], '{"min_age": 20, "max_age": 35, "gender": "Female", "max_distance": 50}', '2024-09-13 10:00:00'),
('Jane Smith', 25, 'Female', 34.0522, -118.2437, ARRAY['art', 'travel'], '{"min_age": 21, "max_age": 30, "gender": "Male", "max_distance": 30}', '2024-09-13 11:00:00')
ON CONFLICT (user_id) DO NOTHING;