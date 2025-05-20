-- ==========================================
-- Index Creation for Optimization Purposes
-- ==========================================

-- Create an index on User(email) to speed up searches by email
CREATE INDEX idx_user_email ON User(email);

-- Create an index on Booking(user_id) to improve JOINs with User
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Create an index on Booking(property_id) to improve JOINs with Property
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Create an index on Booking(start_date) for filtering by date range
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Create an index on Property(location) to optimize filtering by location
CREATE INDEX idx_property_location ON Property(location);

-- ==========================================
-- Performance Measurement Before and After
-- ==========================================

-- Query BEFORE indexing (just for illustration)
-- EXPLAIN ANALYZE SELECT * FROM Booking WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

-- Query AFTER indexing
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    p.name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2024-01-01' AND '2024-12-31';
