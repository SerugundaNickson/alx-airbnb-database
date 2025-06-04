# Query Optimization Report

## Initial Query
The initial query joins Booking, User, Property, and Payment tables to fetch booking, user, property, and payment information.

```sql
SELECT b.id, u.name, u.email, p.name, p.location, pay.amount, pay.payment_date
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id;
Performance Analysis (EXPLAIN ANALYZE)
The initial query showed high cost due to:

Full table scans on large tables.

No indexing on user_id, property_id, or booking_id.
Optimization Steps
Created Indexes
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
Refactored Query

Reduced selected columns to only those needed.

Ensured indexed columns are used in JOIN conditions.
SELECT b.id, u.name, p.name, pay.amount
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id;
Result
Execution time improved significantly.

Indexes reduced full scan cost.
