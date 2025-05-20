# Task 3: Implement Indexes for Optimization

## Objective

Improve the performance of queries on large datasets using indexing.

---

## Index Strategy

### 1. `User` Table
- **email**: frequently filtered via login and lookups.
- **role**: useful for quick filtering (e.g., hosts vs. guests).

### 2. `Booking` Table
- **user_id**: used in joins to track user bookings.
- **property_id**: used to link properties and bookings.
- **start_date**: helpful for range-based queries.

### 3. `Property` Table
- **location**: filtered in search.
- **pricepernight**: filtered or sorted in search results.

---

## Before vs. After Indexing

### Sample Query (before):
```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 'some-uuid';
