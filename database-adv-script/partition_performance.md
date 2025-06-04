# Partitioning Performance Report

## Objective
To improve performance on the Booking table by partitioning it by `start_date`.

## What Was Done
- A new table `booking_partitioned` was created with `RANGE` partitioning by `start_date`.
- Partitions were defined for the years 2022, 2023, and 2024.
- A sample query was run to fetch bookings in June 2023 using `EXPLAIN ANALYZE`.

## Observations
- **Before partitioning**, the query scanned the entire `Booking` table and took longer to execute.
- **After partitioning**, the query only scanned the relevant partition (`booking_2023`), reducing scan time significantly.
- Query plan showed faster execution and less I/O.

## Conclusion
Partitioning the Booking table by date significantly improved query performance for date-specific queries. This is especially effective for large datasets and common filtering like date ranges.
