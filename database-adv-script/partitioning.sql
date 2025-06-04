-- Step 1: Create a new partitioned version of the Booking table
CREATE TABLE booking_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions by year
CREATE TABLE booking_2022 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE booking_2023 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Step 3: Example query on partitioned table
EXPLAIN ANALYZE
SELECT * FROM booking_partitioned
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';
