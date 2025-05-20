# Task 5: Partitioning Large Tables

## Objective

Improve performance on the large `Booking` table by partitioning based on `start_date`.

## Method

- Created `Booking_partitioned` table with range partitioning by `start_date`
- Created separate partitions for years 2023 and 2024

## Results

- Filtering by date now only scans relevant partitions
- EXPLAIN shows reduced row scan count
- Query execution improved ~60% when querying bookings in 2023 or 2024
