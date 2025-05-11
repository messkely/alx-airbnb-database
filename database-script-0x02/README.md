# 🧪 Airbnb Clone - Sample Data

This directory contains sample SQL `INSERT` statements for populating the Airbnb clone database with example data.

---

## 📂 Files

- `seed.sql` — SQL script to populate the tables with sample data.
- `README.md` — This file.

---

## 👥 Entities Populated

- Users (hosts and guests)
- Properties listed by hosts
- Bookings made by users
- Payments for confirmed bookings
- Reviews left by guests
- Messages between users

---

## 🚀 Usage Instructions

Ensure the database schema (`schema.sql`) has already been created.

To insert sample data into your database:

```bash
psql -U <username> -d <database_name> -f seed.sql
