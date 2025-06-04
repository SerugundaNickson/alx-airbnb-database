# Index Performance Analysis

##  Query Example: Retrieve bookings by a specific user

**SQL Query:**

```sql
SELECT * FROM bookings WHERE user_id = 12;

Before Indexing
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 12;
Index Creation
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
After Indexing
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 12;

