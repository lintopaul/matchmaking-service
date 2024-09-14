-- Remove the sample users
DELETE FROM users WHERE name IN (
  'John Doe', 'Jane Smith', 'Mike Johnson', 'Emily Brown', 'David Lee',
  'Sarah Wilson', 'Chris Taylor', 'Amanda Martinez', 'Ryan Garcia', 'Lisa Chen',
  'Kevin Nguyen', 'Rachel Kim', 'Daniel Park', 'Olivia White', 'James Wilson',
  'Sophia Lee', 'Michael Brown', 'Emma Davis', 'Andrew Johnson', 'Isabella Martinez',
  'William Taylor', 'Ava Anderson', 'Ethan Wilson', 'Mia Garcia', 'Alexander Chen'
);