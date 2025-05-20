-- ==============================================
-- Initial complex query (joins with filters)
-- ==============================================

-- Query to get all bookings with related user, property, and payment details
-- Filtering bookings made after a certain date and only successful payments
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2024-01-01'
AND pay.status = 'completed';

-- ==============================================
-- EXPLAIN analysis to measure performance
-- ==============================================

EXPLAIN
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2024-01-01'
AND pay.status = 'completed';
