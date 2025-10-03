# Student Attendance DB – Task 8

This project is an extension of the **Student Attendance Database** for practicing  
**Stored Procedures and Functions** in SQL.

---

## 📂 Files
- **schema.sql** → Base tables (Students, Courses, Enrollments, Attendance)
- **procedures_functions.sql** → Examples of stored procedures and functions
- **sample_output.txt** → Notes / Expected results

---

## 🚀 How to Use
1. Open MySQL Workbench (SQLite doesn’t support procedures/functions).
2. Run `schema.sql` to create tables and insert sample data.
3. Run queries from `procedures_functions.sql`.

---

## 🔑 Concepts Covered
- Creating stored procedures with `CREATE PROCEDURE`
- Creating functions with `CREATE FUNCTION`
- Using parameters (`IN`, `OUT`)
- Conditional logic (`IF`, `CASE`)
- Returning values from functions
- Calling procedures and functions

---

## 📝 Example Queries
```sql
-- Call stored procedure
CALL get_student_attendance(1);

-- Call function
SELECT calculate_attendance_percentage(1) AS attendance_percent;
