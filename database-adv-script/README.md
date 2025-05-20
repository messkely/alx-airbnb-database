# Advanced SQL Tasks – Airbnb Database

This directory `database-adv-script/` contains SQL solutions for advanced database operations on the Airbnb clone project. Tasks covered here focus on practicing subqueries, aggregation, and window functions to analyze and retrieve data efficiently.

---

## 📌 Task 0: Setup and Pre-check

**File(s):** _[None, environment check only]_

This initial task ensures that your development environment is set up correctly:
- You have access to the required Airbnb database.
- You can connect using a SQL client (e.g., `psql` or `MySQL`).
- You understand the schema for the following tables:
  - `User`
  - `Booking`
  - `Property`
  - `Payment`
  - `Review`

**✅ Status:** Environment verified. Proceed to next tasks.

---

## 📌 Task 1: Practice Subqueries

**File:** `subqueries.sql`

### ✅ Objective

- Practice writing **non-correlated** and **correlated** subqueries.
- Use subqueries to filter and analyze data from multiple tables.

### 🧠 Concepts Covered

- Subqueries in `SELECT`, `FROM`, and `WHERE` clauses
- Correlated subqueries that depend on the outer query

### 🧾 Queries Implemented

1. **Find properties with an average rating greater than 4.0**

```sql
SELECT property_id, name
FROM Property
WHERE property_id IN (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
