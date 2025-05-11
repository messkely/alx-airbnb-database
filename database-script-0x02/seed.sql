-- -----------------------------
-- Sample Data for Airbnb Clone
-- -----------------------------

-- Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  ('00000000-0000-0000-0000-000000000001', 'Alice', 'Smith', 'alice@example.com', 'hashed_pass1', '1234567890', 'host', CURRENT_TIMESTAMP),
  ('00000000-0000-0000-0000-000000000002', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pass2', '2345678901', 'guest', CURRENT_TIMESTAMP),
  ('00000000-0000-0000-0000-000000000003', 'Carol', 'Williams', 'carol@example.com', 'hashed_pass3', '3456789012', 'guest', CURRENT_TIMESTAMP);

-- Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
  ('10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 'Cozy Cabin', 'A warm, rustic cabin in the woods.', 'Asheville, NC', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Urban Loft', 'Modern loft in downtown area.', 'New York, NY', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  ('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', '2025-06-01', '2025-06-05', 480.00, 'confirmed', CURRENT_TIMESTAMP),
  ('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000003', '2025-07-10', '2025-07-12', 500.00, 'pending', CURRENT_TIMESTAMP);

-- Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  ('30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000001', 480.00, CURRENT_TIMESTAMP, 'credit_card');

-- Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  ('40000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 5, 'Amazing cabin. Would stay again!', CURRENT_TIMESTAMP),
  ('40000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000003', 4, 'Stylish loft with great location.', CURRENT_TIMESTAMP);

-- Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  ('50000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Hi Alice, is the cabin available for July?', CURRENT_TIMESTAMP),
  ('50000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Yes, it is. Let me know your dates!', CURRENT_TIMESTAMP);
