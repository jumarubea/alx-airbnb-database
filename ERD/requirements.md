# Entity-Relationship Diagram (ERD)

A textual representation of the entities, attributes, relationships, and constraints in the system

## Entities

### User
- **user_id** (PK, UUID, Indexed)  
- `first_name` (VARCHAR, NOT NULL)  
- `last_name` (VARCHAR, NOT NULL)  
- `email` (VARCHAR, UNIQUE, NOT NULL)  
- `password_hash` (VARCHAR, NOT NULL)  
- `phone_number` (VARCHAR, NULL)  
- `role` (ENUM: `guest`, `host`, `admin`, NOT NULL)  
- `created_at` (TIMESTAMP, DEFAULT `CURRENT_TIMESTAMP`)  

---

### Property
- **property_id** (PK, UUID, Indexed)  
- `host_id` (FK → User.user_id)  
- `name` (VARCHAR, NOT NULL)  
- `description` (TEXT, NOT NULL)  
- `location` (VARCHAR, NOT NULL)  
- `price_per_night` (DECIMAL, NOT NULL)  
- `created_at` (TIMESTAMP, DEFAULT `CURRENT_TIMESTAMP`)  
- `updated_at` (TIMESTAMP, ON UPDATE `CURRENT_TIMESTAMP`)  

---

### Booking
- **booking_id** (PK, UUID, Indexed)  
- `property_id` (FK → Property.property_id)  
- `user_id` (FK → User.user_id)  
- `start_date` (DATE, NOT NULL)  
- `end_date` (DATE, NOT NULL)  
- `total_price` (DECIMAL, NOT NULL)  
- `status` (ENUM: `pending`, `confirmed`, `canceled`, NOT NULL)  
- `created_at` (TIMESTAMP, DEFAULT `CURRENT_TIMESTAMP`)  

---

### Payment
- **payment_id** (PK, UUID, Indexed)  
- `booking_id` (FK → Booking.booking_id)  
- `amount` (DECIMAL, NOT NULL)  
- `payment_date` (TIMESTAMP, DEFAULT `CURRENT_TIMESTAMP`)  
- `payment_method` (ENUM: `credit_card`, `paypal`, `stripe`, NOT NULL)  

---

### Review
- **review_id** (PK, UUID, Indexed)  
- `property_id` (FK → Property.property_id)  
- `user_id` (FK → User.user_id)  
- `rating` (INTEGER, NOT NULL, CHECK: 1 ≤ rating ≤ 5)  
- `comment` (TEXT, NOT NULL)  
- `created_at` (TIMESTAMP, DEFAULT `CURRENT_TIMESTAMP`)  

---

### Message
- **message_id** (PK, UUID, Indexed)  
- `sender_id` (FK → User.user_id)  
- `recipient_id` (FK → User.user_id)  
- `message_body` (TEXT, NOT NULL)  
- `sent_at` (TIMESTAMP, DEFAULT `CURRENT_TIMESTAMP`)  

---

## Relationships

- **User–Property** (One-to-Many)  
  - A host (User with `role = 'host'`) can list multiple properties.  
  - `Property.host_id` → `User.user_id`

- **User–Booking** (One-to-Many)  
  - A user can make multiple bookings.  
  - `Booking.user_id` → `User.user_id`

- **Property–Booking** (One-to-Many)  
  - A property can have many bookings.  
  - `Booking.property_id` → `Property.property_id`

- **Booking–Payment** (One-to-One)  
  - Each booking has one payment (if completed).  
  - `Payment.booking_id` → `Booking.booking_id`

- **User–Review** (One-to-Many)  
  - A user can write multiple reviews.  
  - `Review.user_id` → `User.user_id`

- **Property–Review** (One-to-Many)  
  - A property can have multiple reviews.  
  - `Review.property_id` → `Property.property_id`

- **User–Message (Self-Referencing)**  
  - A user can send messages to and receive messages from other users.  
  - `Message.sender_id` → `User.user_id`  
  - `Message.recipient_id` → `User.user_id`  

---

## Indexing Notes

- `User.email`: Indexed and UNIQUE  
- `Property.property_id`: Indexed  
- `Booking.booking_id`: Indexed  
