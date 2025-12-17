# Hope Alive Clinic Database – SQL Project

## Overview
Hope Alive Clinic, a children’s hospital in Dille Village, Borno State, faced major challenges with manual record-keeping. Patient records, appointments, and prescriptions were stored on paper, leading to lost files, mismatched prescriptions, and double-booked appointments.  

This project focuses on designing and implementing a **relational database system** to efficiently manage patient care, appointments, doctors, departments, and prescriptions, ensuring reliable access to medical history and improving overall service delivery.

---

## Problem Statement
- High infant and child mortality due to short illnesses in the region.  
- Manual record-keeping caused inefficiency and errors in patient care.  
- Doctors lacked access to comprehensive patient histories for better diagnosis and treatment.

---

## Objectives
- Track patients, appointments, and prescriptions in a structured database.  
- Link guardians to multiple patients for reusability.  
- Maintain historical records of visits and prescriptions.  
- Assign doctors to departments according to specialization.  
- Generate insights from queries, e.g., patients per department, doctor workload, and prescriptions in specific timeframes.

---

## Database Schema
The database is designed with **five core tables**:

| Table         | Description |
|---------------|-------------|
| `Patients`    | Stores patient information, including guardian details. |
| `Appointments`| Tracks appointments linking patients and doctors. |
| `Doctors`     | Stores doctor info and their department. |
| `Departments` | Defines hospital departments and specializations. |
| `Prescriptions` | Records prescriptions linked to appointments. |

**Relationships:**
- Each appointment links one patient to one doctor.  
- Each prescription links to an appointment.  
- Doctors are assigned to departments, and each department can have multiple doctors.

**Constraints & Rules:**
- Primary keys on all tables (`patient_id`, `appointment_id`, etc.).  
- Foreign keys enforce relationships between tables.  
- Critical fields are NOT NULL (e.g., patient info, appointment date, drug name).  
- Appointment status is restricted (Scheduled, Completed, etc.).  
- Trigger automatically calculates patient age from date of birth.

---

## Sample Queries
1. Retrieve all scheduled appointments for patients.  
2. Retrieve the next scheduled appointment for a specific patient.  
3. Count distinct patients seen by each department.  
4. Retrieve all prescriptions by a specific doctor in the last 6 months.  
5. Show patients with more than 3 appointments in the last year.  
6. Salary analysis queries (bonus, active/expired contracts, etc.).  

*(Full SQL scripts are included in `queries.sql`.)*

---

## Sample Data
- A small set of dummy data is provided in `data.sql` for testing queries.  


---

## Technologies Used
- SQL (MySQL/PostgreSQL/SQL Server)  
- ERD Design Tool (e.g., Draw.io, Lucidchart)

---

## Learning Outcomes
- Hands-on experience designing a normalized relational database.  
- Applying constraints, triggers, and foreign keys for data integrity.  
- Writing complex SQL queries for real-world healthcare analytics.  
- Understanding workflow automation in hospital systems.

---

## Repository Structure
