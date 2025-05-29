-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  ('uuid-1', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '1234567890', 'guest', '2025-05-28 09:30:00'),
  ('uuid-2', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '0987654321', 'host', '2025-05-28 09:45:00');

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
  ('prop-1', 'uuid-2', 'Cozy Cabin', 'A cabin in the woods', 'Colorado', 120.00, '2025-05-28 10:00:00', '2025-05-28 10:00:00'),
  ('prop-2', 'uuid-2', 'City Apartment', 'Modern apartment in city center', 'New York', 200.00, '2025-05-28 10:15:00', '2025-05-28 10:15:00');

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  ('book-1', 'prop-1', 'uuid-1', '2025-06-01', '2025-06-05', 480.00, 'confirmed', '2025-05-28 11:00:00'),
  ('book-2', 'prop-2', 'uuid-1', '2025-06-10', '2025-06-12', 400.00, 'pending', '2025-05-28 11:15:00');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  ('pay-1', 'book-1', 480.00, '2025-05-29 08:00:00', 'credit_card');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  ('rev-1', 'prop-1', 'uuid-1', 5, 'Wonderful stay!', '2025-05-29 09:00:00');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  ('msg-1', 'uuid-1', 'uuid-2', 'Hi, is the cabin available for June?', '2025-05-29 09:30:00'),
  ('msg-2', 'uuid-2', 'uuid-1', 'Yes, it is available!', '2025-05-29 09:35:00');
