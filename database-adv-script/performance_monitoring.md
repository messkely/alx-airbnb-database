# Task 6: Monitor and Refine Database Performance

## Monitoring Tools Used

- `EXPLAIN ANALYZE`
- `SHOW PROFILE` (MySQL only, not available in PostgreSQL)

## Queries Analyzed

1. Fetch bookings for a given user:
   ```sql
   EXPLAIN ANALYZE
   SELECT * FROM Booking WHERE user_id = 'uuid';
