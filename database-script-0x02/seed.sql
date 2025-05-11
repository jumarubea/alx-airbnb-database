INSERT INTO User (user_id, name, email, role) VALUES
('11111111-1111-1111-1111-111111111111', 'Juma Rubea', 'juma@example.com', 'host'),
('22222222-2222-2222-2222-222222222222', 'Bob Guest', 'bob@example.com', 'guest'),
('33333333-3333-3333-3333-333333333333', 'Carol Host', 'carol@example.com', 'host'),
('44444444-4444-4444-4444-444444444444', 'Dave Guest', 'dave@example.com', 'guest');


INSERT INTO Property (property_id, host_id, title, description, location, price_per_night) VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'Cozy Cottage', 'A small cozy cottage in the countryside.', 'Greenfield', 100.00),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '33333333-3333-3333-3333-333333333333', 'Modern Apartment', 'Spacious apartment near downtown.', 'City Center', 150.00);


INSERT INTO Booking (booking_id, property_id, guest_id, start_date, end_date, total_price) VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', '2025-06-01', '2025-06-05', 400.00),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '44444444-4444-4444-4444-444444444444', '2025-07-10', '2025-07-12', 300.00);


INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('ppppppp1-pppp-pppp-pppp-pppppppppppp', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 400.00, '2025-05-25 10:00:00', 'Credit Card'),
('ppppppp2-pppp-pppp-pppp-pppppppppppp', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 300.00, '2025-07-01 09:00:00', 'PayPal');


INSERT INTO Review (review_id, booking_id, rating, comment) VALUES
('rrrrrrr1-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 5, 'Wonderful stay, very clean and peaceful.'),
('rrrrrrr2-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 4, 'Nice place, a bit noisy at night.');


INSERT INTO Message (message_id, sender_id, receiver_id, message_text, timestamp) VALUES
('mmmmmmm1-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi, is your cottage available in June?', '2025-05-20 08:00:00'),
('mmmmmmm2-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Yes, it is available from June 1 to June 5.', '2025-05-20 09:00:00');

