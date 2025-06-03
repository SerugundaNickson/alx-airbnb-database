-- This file contains complex SQL join queries
-- 1. INNER JOIN: All bookings and their respective users
SELECT
    b.id AS booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name,
    u.email
FROM
    Booking b
INNER JOIN
    User u ON b.user_id = u.id;

-- 2. LEFT JOIN: All properties and their reviews (even those without reviews)
SELECT
    p.id AS property_id,
    p.name AS property_name,
    r.id AS review_id,
    r.rating,
    r.comment
FROM
    Property p
LEFT JOIN
    Review r ON p.id = r.property_id;

-- 3. FULL OUTER JOIN: All users and all bookings, even unmatched ones
-- Note: FULL OUTER JOIN might not be supported in MySQL, use UNION workaround
SELECT
    u.id AS user_id,
    u.name,
    b.id AS booking_id,
    b.property_id
FROM
    User u
LEFT JOIN
    Booking b ON u.id = b.user_id

UNION

SELECT
    u.id AS user_id,
    u.name,
    b.id AS booking_id,
    b.property_id
FROM
    User u
RIGHT JOIN
    Booking b ON u.id = b.user_id;

