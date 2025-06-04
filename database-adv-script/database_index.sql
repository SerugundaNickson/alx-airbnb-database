
-- Index on user email (for fast lookups)
CREATE INDEX idx_users_email ON users(email);

-- Index on bookings by user_id (for JOINs or WHERE conditions)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings by property_id (for JOINs)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on properties price (for ORDER BY or range filtering)
CREATE INDEX idx_properties_price ON properties(price);
