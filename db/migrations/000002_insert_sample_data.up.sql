-- Insert 25 sample users
INSERT INTO users (user_id, name, age, gender, latitude, longitude, interests, preferences, last_active)
VALUES
  (1, 'John Doe', 28, 'Male', 40.7128, -74.0060, ARRAY['sports', 'music'], '{"min_age": 20, "max_age": 35, "gender": "Female", "max_distance": 50}', '2024-09-13 10:00:00'),
  (2, 'Jane Smith', 25, 'Female', 34.0522, -118.2437, ARRAY['art', 'travel'], '{"min_age": 21, "max_age": 30, "gender": "Male", "max_distance": 30}', '2024-09-13 11:00:00'),
  (3, 'Mike Johnson', 32, 'Male', 41.8781, -87.6298, ARRAY['cooking', 'hiking'], '{"min_age": 25, "max_age": 40, "gender": "Female", "max_distance": 40}', '2024-09-13 12:00:00'),
  (4, 'Emily Brown', 29, 'Female', 37.7749, -122.4194, ARRAY['yoga', 'reading'], '{"min_age": 27, "max_age": 35, "gender": "Male", "max_distance": 25}', '2024-09-13 13:00:00'),
  (5, 'David Lee', 35, 'Male', 42.3601, -71.0589, ARRAY['photography', 'travel'], '{"min_age": 30, "max_age": 40, "gender": "Female", "max_distance": 35}', '2024-09-13 14:00:00'),
  (6, 'Sarah Wilson', 27, 'Female', 39.9526, -75.1652, ARRAY['music', 'dancing'], '{"min_age": 25, "max_age": 33, "gender": "Male", "max_distance": 30}', '2024-09-13 15:00:00'),
  (7, 'Chris Taylor', 31, 'Male', 33.7490, -84.3880, ARRAY['sports', 'cooking'], '{"min_age": 26, "max_age": 36, "gender": "Female", "max_distance": 45}', '2024-09-13 16:00:00'),
  (8, 'Amanda Martinez', 26, 'Female', 29.7604, -95.3698, ARRAY['art', 'yoga'], '{"min_age": 24, "max_age": 32, "gender": "Male", "max_distance": 20}', '2024-09-13 17:00:00'),
  (9, 'Ryan Garcia', 33, 'Male', 32.7157, -117.1611, ARRAY['hiking', 'photography'], '{"min_age": 28, "max_age": 38, "gender": "Female", "max_distance": 40}', '2024-09-13 18:00:00'),
  (10, 'Lisa Chen', 30, 'Female', 47.6062, -122.3321, ARRAY['travel', 'reading'], '{"min_age": 28, "max_age": 36, "gender": "Male", "max_distance": 35}', '2024-09-13 19:00:00'),
  (11, 'Kevin Nguyen', 29, 'Male', 36.1699, -115.1398, ARRAY['gaming', 'music'], '{"min_age": 23, "max_age": 33, "gender": "Female", "max_distance": 25}', '2024-09-13 20:00:00'),
  (12, 'Rachel Kim', 28, 'Female', 38.9072, -77.0369, ARRAY['dancing', 'cooking'], '{"min_age": 26, "max_age": 34, "gender": "Male", "max_distance": 30}', '2024-09-13 21:00:00'),
  (13, 'Daniel Park', 34, 'Male', 35.2271, -80.8431, ARRAY['sports', 'travel'], '{"min_age": 29, "max_age": 39, "gender": "Female", "max_distance": 50}', '2024-09-13 22:00:00'),
  (14, 'Olivia White', 27, 'Female', 30.2672, -97.7431, ARRAY['yoga', 'art'], '{"min_age": 25, "max_age": 33, "gender": "Male", "max_distance": 30}', '2024-09-13 23:00:00'),
  (15, 'James Wilson', 32, 'Male', 39.7684, -86.1581, ARRAY['photography', 'hiking'], '{"min_age": 27, "max_age": 37, "gender": "Female", "max_distance": 40}', '2024-09-14 00:00:00'),
  (16, 'Sophia Lee', 29, 'Female', 25.7617, -80.1918, ARRAY['music', 'travel'], '{"min_age": 26, "max_age": 34, "gender": "Male", "max_distance": 35}', '2024-09-14 01:00:00'),
  (17, 'Michael Brown', 31, 'Male', 44.9778, -93.2650, ARRAY['cooking', 'reading'], '{"min_age": 26, "max_age": 36, "gender": "Female", "max_distance": 30}', '2024-09-14 02:00:00'),
  (18, 'Emma Davis', 26, 'Female', 33.4484, -112.0740, ARRAY['dancing', 'yoga'], '{"min_age": 24, "max_age": 32, "gender": "Male", "max_distance": 25}', '2024-09-14 03:00:00'),
  (19, 'Andrew Johnson', 35, 'Male', 39.2904, -76.6122, ARRAY['sports', 'photography'], '{"min_age": 30, "max_age": 40, "gender": "Female", "max_distance": 45}', '2024-09-14 04:00:00'),
  (20, 'Isabella Martinez', 28, 'Female', 32.7767, -96.7970, ARRAY['art', 'hiking'], '{"min_age": 26, "max_age": 34, "gender": "Male", "max_distance": 30}', '2024-09-14 05:00:00'),
  (21, 'William Taylor', 33, 'Male', 38.2527, -85.7585, ARRAY['travel', 'music'], '{"min_age": 28, "max_age": 38, "gender": "Female", "max_distance": 40}', '2024-09-14 06:00:00'),
  (22, 'Ava Anderson', 27, 'Female', 36.1627, -86.7816, ARRAY['reading', 'yoga'], '{"min_age": 25, "max_age": 33, "gender": "Male", "max_distance": 35}', '2024-09-14 07:00:00'),
  (23, 'Ethan Wilson', 30, 'Male', 42.3314, -83.0458, ARRAY['gaming', 'cooking'], '{"min_age": 25, "max_age": 35, "gender": "Female", "max_distance": 30}', '2024-09-14 08:00:00'),
  (24, 'Mia Garcia', 29, 'Female', 39.9612, -82.9988, ARRAY['dancing', 'photography'], '{"min_age": 27, "max_age": 35, "gender": "Male", "max_distance": 35}', '2024-09-14 09:00:00'),
  (25, 'Alexander Chen', 34, 'Male', 35.7796, -78.6382, ARRAY['hiking', 'travel'], '{"min_age": 29, "max_age": 39, "gender": "Female", "max_distance": 50}', '2024-09-14 10:00:00')
ON CONFLICT (user_id) DO UPDATE SET
  name = EXCLUDED.name,
  age = EXCLUDED.age,
  gender = EXCLUDED.gender,
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  interests = EXCLUDED.interests,
  preferences = EXCLUDED.preferences,
  last_active = EXCLUDED.last_active;