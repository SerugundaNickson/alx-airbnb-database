# ALX Airbnb Database Schema

## Overview

This SQL schema defines the database structure for the Airbnb clone project. It follows normalization principles up to the Third Normal Form (3NF) and includes proper indexing and constraints to ensure data integrity and performance.

## Tables

### Users
- Stores user details (guest, host, or admin).
- Includes unique and required fields like email.

### Properties
- Stores property listings created by hosts.
- Linked to users via `host_id`.

### Bookings
- Represents reservations made by users.
- Linked to properties and users.
- Includes status values: `pending`, `confirmed`, `canceled`.

### Payments
- Captures payment details for each booking.
- Supports multiple payment methods.

### Reviews
- Allows users to rate and review properties.
- Ratings constrained between 1 and 5.

### Messages
- Enables communication between users (sender and recipient).

## Constraints & Indexes
- All foreign keys and necessary constraints are applied.
- Additional indexes added to commonly queried fields for optimization.

## Normalization
- Database is normalized up to 3NF.
- Redundant data removed and relationships well defined via foreign keys.

## Files
- `schema.sql`: Contains SQL code to create the entire schema.
- `README.md`: This file.

## Author
Serugunda Nickson

