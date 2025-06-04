# Database Performance Monitoring Report

## Objective
To monitor query performance, identify bottlenecks, and refine the database schema to improve efficiency.

## Tools Used
- `EXPLAIN ANALYZE` (PostgreSQL)
- `SHOW PROFILE` (MySQL)

## Queries Monitored

### 1. Fetch bookings by user:
```sql
EXPLAIN ANALYZE
SELECT * FROM booking
WHERE user_id = 5;

List properties with average rating:
EXPLAIN ANALYZE
SELECT p.id, p.name, AVG(r.rating) as avg_rating
FROM property p
JOIN review r ON p.id = r.property_id
GROUP BY p.id, p.name;

Find bookings in a date range:
EXPLAIN ANALYZE
SELECT * FROM booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-03-31';

Identified Bottlenecks
Full table scans observed on the booking table when filtering by user_id or start_date.
Join on property and review was slow due to missing indexes on property_id in review.

Schema Improvements
✅ New Indexes Added
CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_start_date ON booking(start_date);
CREATE INDEX idx_review_property_id ON review(property_id);

Post-Improvement Results
After adding indexes:
Query on booking.user_id improved from Seq Scan to Index Scan, reducing cost and execution time.

Join between property and review now uses indexed access, making aggregation faster.

Filtering bookings by date is now faster due to idx_booking_start_date.

Conclusion
Regular performance monitoring revealed bottlenecks in query execution. Applying proper indexes and analyzing query plans led to measurable improvements in speed and resource use. These changes are essential for scalability in large datasets.
