# Entity-Relationship Diagram (ERD) - ALX AirBnB Clone

## Objective

Create an Entity-Relationship (ER) diagram based on the database specification.

## Instructions

- Identify all entities (User, Property, Booking, etc.) and their attributes.
- Define the relationships between entities (e.g., User to Booking, Property to Booking).
- Use Draw.io or another tool to create a visual representation of your ER diagram.

---

## Entities and Attributes

### User
- `user_id`: UUID, Primary Key, Indexed
- `first_name`: VARCHAR, NOT NULL
- `last_name`: VARCHAR, NOT NULL
- `email`: VARCHAR, UNIQUE, NOT NULL
- `password_hash`: VARCHAR, NOT NULL
- `phone_number`: VARCHAR, NULL
- `role`: ENUM (guest, host, admin), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Property
- `property_id`: UUID, Primary Key, Indexed
- `host_id`: UUID, Foreign Key → User(user_id)
- `name`: VARCHAR, NOT NULL
- `description`: TEXT, NOT NULL
- `location`: VARCHAR, NOT NULL
- `pricepernight`: DECIMAL, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### Booking
- `booking_id`: UUID, Primary Key, Indexed
- `property_id`: UUID, Foreign Key → Property(property_id)
- `user_id`: UUID, Foreign Key → User(user_id)
- `start_date`: DATE, NOT NULL
- `end_date`: DATE, NOT NULL
- `total_price`: DECIMAL, NOT NULL
- `status`: ENUM (pending, confirmed, canceled), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Payment
- `payment_id`: UUID, Primary Key, Indexed
- `booking_id`: UUID, Foreign Key → Booking(booking_id)
- `amount`: DECIMAL, NOT NULL
- `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `payment_method`: ENUM (credit_card, paypal, stripe), NOT NULL

### Review
- `review_id`: UUID, Primary Key, Indexed
- `property_id`: UUID, Foreign Key → Property(property_id)
- `user_id`: UUID, Foreign Key → User(user_id)
- `rating`: INTEGER, CHECK rating >= 1 AND rating <= 5, NOT NULL
- `comment`: TEXT, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Message
- `message_id`: UUID, Primary Key, Indexed
- `sender_id`: UUID, Foreign Key → User(user_id)
- `recipient_id`: UUID, Foreign Key → User(user_id)
- `message_body`: TEXT, NOT NULL
- `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Constraints

### User Table
- Unique constraint on `email`
- Non-null constraints on required fields

### Property Table
- Foreign key constraint on `host_id` → User
- Non-null constraints on essential attributes

### Booking Table
- Foreign key constraints on `property_id`, `user_id`
- `status` must be one of `pending`, `confirmed`, or `canceled`

### Payment Table
- Foreign key constraint on `booking_id`

### Review Table
- Foreign key constraints on `property_id`, `user_id`
- `rating` must be between 1 and 5

### Message Table
- Foreign key constraints on `sender_id`, `recipient_id`

---

## Indexing

- Primary Keys: Automatically indexed
- Additional Indexes:
  - `email` in the User table
  - `property_id` in the Property and Booking tables
  - `booking_id` in the Booking and Payment tables

---

## Relationships

- A **User** can host many **Properties**
- A **Property** belongs to one **User** (host)
- A **User** can make many **Bookings**
- A **Booking** is made by one **User**
- A **Booking** is for one **Property**
- A **Booking** can have one **Payment**
- A **User** can leave many **Reviews** on **Properties**
- A **Property** can have many **Reviews**
- A **User** can send and receive many **Messages**

---

## Diagram File
## ER Diagram

![ER Diagram](![github image](https://github.com/user-attachments/assets/24877834-7c78-43db-9e62-97fa97ed57c8)
)

