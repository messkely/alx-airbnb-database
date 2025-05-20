-- 1. INNER JOIN: Get all bookings and the respective users who made those bookings
SELECT
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM Booking
INNER JOIN User ON Booking.user_id = User.user_id;

-- 2. LEFT JOIN: Get all properties and their reviews, including properties that have no reviews
SELECT
    Property.property_id,
    Property.name AS property_name,
    Property.description,
    Review.review_id,
    Review.rating,
    Review.comment,
    Review.created_at
FROM Property
LEFT JOIN Review ON Property.property_id = Review.property_id;

-- 3. FULL OUTER JOIN: Get all users and all bookings, even if there's no match
SELECT
    User.user_id,
    User.first_name,
    User.last_name,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date
FROM User
FULL OUTER JOIN Booking ON User.user_id = Booking.user_id;
