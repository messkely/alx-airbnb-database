# Task 4: Optimize Complex Queries

## Initial Query

Joined four tables: `Booking`, `User`, `Property`, and `Payment` to retrieve all booking-related details.

## Performance Issues (Using EXPLAIN)

- Sequential scans on large tables
- Missing indexes on foreign keys

## Optimization Steps

1. Added indexes:
   ```sql
   CREATE INDEX idx_booking_user_id ON Booking(user_id);
   CREATE INDEX idx_booking_property_id ON Booking(property_id);
   CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
