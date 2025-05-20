
-- Step 1: Create a new partitioned table structure based on start_date
CREATE TABLE Booking_partitioned (
    booking_id UUID,
    user_id UUID,
    property_id UUID,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions
CREATE TABLE Booking_2023 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
