-- Index for email lookup in users table
CREATE INDEX idx_users_email ON users(email);

-- Index for filtering bookings by user_id
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index for sorting properties by price
CREATE INDEX idx_properties_price ON properties(price);
