# 📊 Database Normalization Report

## 🎯 Objective
Apply normalization principles to the **ALX Airbnb Clone Database** to ensure the schema satisfies **Third Normal Form (3NF)**, thereby reducing redundancy and improving data integrity.

---

## 🔍 Normalization Overview

Normalization involves structuring a relational database to reduce redundancy and improve data integrity. The three main stages we address are:

### 1NF (First Normal Form)
- Eliminate repeating groups
- Ensure atomic (indivisible) values

### 2NF (Second Normal Form)
- Satisfy 1NF
- Eliminate partial dependencies (no non-prime attribute is dependent on part of a composite primary key)

### 3NF (Third Normal Form)
- Satisfy 2NF
- Eliminate transitive dependencies (non-prime attributes depend only on the key)

---

## 🧱 Entity Analysis

### 1. `User`
- ✅ All attributes are atomic (1NF).
- ✅ No partial dependencies (2NF) since `user_id` is the sole primary key.
- ✅ No transitive dependencies (3NF). All non-key attributes depend directly on `user_id`.

### 2. `Property`
- ✅ Atomic values (1NF).
- ✅ Fully dependent on `property_id`.
- ✅ `host_id` is a foreign key to `User`. No transitive dependencies exist within this table.

### 3. `Booking`
- ✅ Atomic fields.
- ✅ Composite relationships are managed via foreign keys.
- ✅ `total_price` is a derived attribute (can be recalculated from `pricepernight × nights`). However, it's included for performance optimization. This is acceptable if clearly documented.

### 4. `Payment`
- ✅ Atomic and fully dependent on `payment_id`.
- ✅ No transitive dependencies.
- ✅ Each payment is directly related to one booking, no multivalued dependencies.

### 5. `Review`
- ✅ Rating is atomic and constrained.
- ✅ Depends directly on `review_id`.
- ✅ Foreign keys (`user_id`, `property_id`) are legitimate — no transitive dependencies.

### 6. `Message`
- ✅ Sender and recipient IDs both reference `User`.
- ✅ All fields are atomic and directly dependent on the primary key (`message_id`).

---

## 🧠 Observations and Recommendations

- ⚠️ `total_price` in `Booking` is a **derived** attribute based on `Property.pricepernight × number_of_nights`. To strictly follow 3NF, it could be removed and computed in queries. However, keeping it for performance is acceptable if treated as **redundant but controlled**.

- ✅ All entities have primary keys (UUIDs).
- ✅ All foreign keys are clearly defined.
- ✅ No composite primary keys are used, so partial dependency is not a concern.
- ✅ No transitive dependencies identified.

---

## ✅ Conclusion

The schema satisfies:

- **1NF**: All fields contain atomic values.
- **2NF**: No partial dependencies on a composite key.
- **3NF**: No transitive dependencies exist.

The database design is **fully normalized to 3NF** and ready for production use.

---

## 📌 Future Considerations

- Consider introducing a `Property_Amenities` join table to manage many-to-many relationships for features (e.g., Wi-Fi, Pool).
- If pricing structures become dynamic (seasonal rates, discounts), extract pricing into a separate `Pricing` table.


