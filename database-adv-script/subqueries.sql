-- Query 1: Properties with average rating > 4.0 using a non-correlated subquery
SELECT *
FROM Property
WHERE id IN (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- Query 2: Correlated subquery to find users who have made more than 3 bookings
SELECT *
FROM User
WHERE (
    SELECT COUNT(*)
    FROM Booking
    WHERE Booking.user_id = User.id
) > 3;

