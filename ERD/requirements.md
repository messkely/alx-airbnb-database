# Entity-Relationship Diagram Requirements

## 📘 Objective
Design and document an Entity-Relationship Diagram (ERD) for the **ALX Airbnb Clone Database**. This diagram models the relationships between core entities such as Users, Properties, Bookings, and others involved in the rental application.

---

## 🧱 Entities and Attributes

### 🧑 User
- `user_id`: UUID, Primary Key, Indexed
- `first_name`: VARCHAR, NOT NULL
- `last_name`: VARCHAR, NOT NULL
- `email`: VARCHAR, UNIQUE, NOT NULL
- `password_hash`: VARCHAR, NOT NULL
- `phone_number`: VARCHAR, NULL
- `role`: ENUM (guest, host, admin), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 🏠 Property
- `property_id`: UUID, Primary Key, Indexed
- `host_id`: UUID, Foreign Key → User(user_id)
- `name`: VARCHAR, NOT NULL
- `description`: TEXT, NOT NULL
- `location`: VARCHAR, NOT NULL
- `pricepernight`: DECIMAL, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### 📆 Booking
- `booking_id`: UUID, Primary Key, Indexed
- `property_id`: UUID, Foreign Key → Property(property_id)
- `user_id`: UUID, Foreign Key → User(user_id)
- `start_date`: DATE, NOT NULL
- `end_date`: DATE, NOT NULL
- `total_price`: DECIMAL, NOT NULL
- `status`: ENUM (pending, confirmed, canceled), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 💳 Payment
- `payment_id`: UUID, Primary Key, Indexed
- `booking_id`: UUID, Foreign Key → Booking(booking_id)
- `amount`: DECIMAL, NOT NULL
- `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `payment_method`: ENUM (credit_card, paypal, stripe), NOT NULL

### 🌟 Review
- `review_id`: UUID, Primary Key, Indexed
- `property_id`: UUID, Foreign Key → Property(property_id)
- `user_id`: UUID, Foreign Key → User(user_id)
- `rating`: INTEGER (1–5), CHECK rating >= 1 AND rating <= 5, NOT NULL
- `comment`: TEXT, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 💬 Message
- `message_id`: UUID, Primary Key, Indexed
- `sender_id`: UUID, Foreign Key → User(user_id)
- `recipient_id`: UUID, Foreign Key → User(user_id)
- `message_body`: TEXT, NOT NULL
- `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## 🔗 Relationships and Constraints

- **User → Property**: One-to-many (User hosts multiple Properties)
- **User → Booking**: One-to-many (User can make multiple Bookings)
- **Property → Booking**: One-to-many (Property can be booked many times)
- **Booking → Payment**: One-to-one (Each Booking has a single Payment)
- **Property → Review**: One-to-many (Property can have multiple Reviews)
- **User → Review**: One-to-many (User can write multiple Reviews)
- **User → Message**: One-to-many for both sender and recipient

> All primary keys are indexed. Additional indexes are applied on:
> - `email` (User)
> - `property_id` (Property, Booking)
> - `booking_id` (Booking, Payment)

---

## 📊 ER Diagram

A visual representation of this model is provided using [Mermaid.js](https://mermaid.js.org/). You can view or edit it using Mermaid Live Editor or import an SVG into draw.io if needed.

<details>
<summary>Click to view Mermaid code</summary>

```mermaid
erDiagram
  USER {
    UUID    user_id    PK
    VARCHAR first_name
    VARCHAR last_name
    VARCHAR email      UNIQUE
    VARCHAR password_hash
    VARCHAR phone_number
    ENUM    role
    TIMESTAMP created_at
  }
  PROPERTY {
    UUID    property_id   PK
    UUID    host_id       FK
    VARCHAR name
    TEXT    description
    VARCHAR location
    DECIMAL pricepernight
    TIMESTAMP created_at
    TIMESTAMP updated_at
  }
  BOOKING {
    UUID    booking_id   PK
    UUID    property_id  FK
    UUID    user_id      FK
    DATE    start_date
    DATE    end_date
    DECIMAL total_price
    ENUM    status
    TIMESTAMP created_at
  }
  PAYMENT {
    UUID    payment_id     PK
    UUID    booking_id     FK
    DECIMAL amount
    TIMESTAMP payment_date
    ENUM    payment_method
  }
  REVIEW {
    UUID    review_id    PK
    UUID    property_id  FK
    UUID    user_id      FK
    INTEGER rating
    TEXT    comment
    TIMESTAMP created_at
  }
  MESSAGE {
    UUID    message_id    PK
    UUID    sender_id     FK
    UUID    recipient_id  FK
    TEXT    message_body
    TIMESTAMP sent_at
  }

  USER ||--o{ PROPERTY   : hosts
  USER ||--o{ BOOKING    : makes
  PROPERTY ||--o{ BOOKING : has
  BOOKING ||--|| PAYMENT  : is_paid_by
  PROPERTY ||--o{ REVIEW  : receives
  USER ||--o{ REVIEW      : writes
  USER ||--o{ MESSAGE     : sends
  USER ||--o{ MESSAGE     : receives
