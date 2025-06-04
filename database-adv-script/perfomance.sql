-- Initial complex query with multiple joins
SELECT
    b.id AS booking_id,
    u.name AS user_name,
    u.email AS user_email,
    p.name AS property_name,
    p.location AS property_location,
    pay.amount AS payment_amount,
    pay.payment_date
FROM
    Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id;

-- Analyze performance of initial query
EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    u.name AS user_name,
    u.email AS user_email,
    p.name AS property_name,
    p.location AS property_location,
    pay.amount AS payment_amount,
    pay.payment_date
FROM
    Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id;

-- Optimized query (example: if we discover unnecessary columns or joins)
SELECT
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount
FROM
    Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id;
