# 🏗️ Airbnb Clone - Database Schema

This directory contains the SQL schema for the Airbnb clone project as part of the ALX Software Engineering curriculum.

---

## 📂 Files

- `schema.sql` — SQL script to create the database schema with all necessary tables, constraints, and indexes.
- `README.md` — Documentation and usage instructions.

---

## 📋 Entities Defined

1. `User`
2. `Property`
3. `Booking`
4. `Payment`
5. `Review`
6. `Message`

All entities use `UUID` for primary keys and are linked using foreign keys with `ON DELETE CASCADE` to preserve referential integrity.

---

## ✅ How to Use

To initialize the schema in a PostgreSQL database:

```bash
psql -U <username> -d <database_name> -f schema.sql
