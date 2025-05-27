# Database Normalization – Airbnb Clone

## ✅ What is Normalization?
Normalization is the process of structuring a relational database to reduce data redundancy and improve data integrity. It involves dividing tables and ensuring that dependencies are logical and only on the primary key.

---

## ✅ Normal Forms Explained

- **First Normal Form (1NF):**
  - All columns contain atomic values (no lists or nested data).
  - Each row is unique.

- **Second Normal Form (2NF):**
  - Must meet 1NF.
  - All non-key attributes are fully functionally dependent on the entire primary key (especially for composite keys).

- **Third Normal Form (3NF):**
  - Must meet 2NF.
  - All attributes are only dependent on the primary key (no transitive dependencies).

---

## ✅ Normalization Applied to the Airbnb Schema

### 1. **User Table**
Already in 3NF:
- No repeating groups.
- All non-key attributes depend directly on the `user_id`.
- No transitive dependencies.

### 2. **Property Table**
In 3NF:
- Each property is linked to a single `host_id` (FK).
- All attributes (name, description, etc.) depend only on the `property_id`.

### 3. **Booking Table**
In 3NF:
- Each booking relates to a single property and user.
- `status`, `start_date`, `end_date`, and `total_price` all depend only on `booking_id`.

### 4. **Payment Table**
In 3NF:
- One payment per booking.
- `amount`, `payment_date`, and `payment_method` are directly dependent on `payment_id`.

### 5. **Review Table**
In 3NF:
- Linked to both property and user.
- `rating` and `comment` depend only on `review_id`.

### 6. **Message Table**
In 3NF:
- Message is sent from `sender_id` to `recipient_id`.
- `message_body` and `sent_at` are functionally dependent on `message_id`.

---

## ✅ Summary of Functional Dependencies

| Table     | Functional Dependencies                         |
|-----------|-------------------------------------------------|
| User      | user_id → first_name, last_name, email, etc.    |
| Property  | property_id → host_id, name, description, etc.  |
| Booking   | booking_id → property_id, user_id, dates, etc.  |
| Payment   | payment_id → booking_id, amount, method, etc.   |
| Review    | review_id → property_id, user_id, rating, etc.  |
| Message   | message_id → sender_id, recipient_id, body, etc.|

---

## ✅ Conclusion

After reviewing the current schema, all tables comply with **Third Normal Form (3NF)**. No redundancies or transitive dependencies were found. Each non-key attribute depends only on the primary key of its table.

