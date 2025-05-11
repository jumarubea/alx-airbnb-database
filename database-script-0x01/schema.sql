CREATE TABLE User (
    user_id UUID PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(20) CHECK (role IN ('host', 'guest')) NOT NULL
);

CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    price_per_night DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (host_id) REFERENCES User(user_id)
);

CREATE INDEX idx_property_host_id ON Property(host_id);

CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    guest_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (guest_id) REFERENCES User(user_id)
);

CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_guest_id ON Booking(guest_id);

CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID UNIQUE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP NOT NULL,
    payment_method VARCHAR(50),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5) NOT NULL,
    comment TEXT,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE INDEX idx_review_booking_id ON Review(booking_id);

CREATE TABLE Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    receiver_id UUID NOT NULL,
    message_text TEXT NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    FOREIGN KEY (sender_id) REFERENCES User(user_id),
    FOREIGN KEY (receiver_id) REFERENCES User(user_id)
);

CREATE INDEX idx_message_sender_id ON Message(sender_id);
CREATE INDEX idx_message_receiver_id ON Message(receiver_id);

