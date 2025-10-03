-- procedures_functions.sql
USE student_attendance;

-- 1. Stored Procedure: Get attendance details of a student
DELIMITER //
CREATE PROCEDURE get_student_attendance(IN studentId INT)
BEGIN
    SELECT s.name, a.attendance_date, a.status
    FROM Students s
    JOIN Attendance a ON s.id = a.student_id
    WHERE s.id = studentId;
END //
DELIMITER ;

-- Call it
CALL get_student_attendance(1);

-- 2. Stored Procedure with conditional logic
DELIMITER //
CREATE PROCEDURE check_student_age(IN studentId INT, OUT age_group VARCHAR(20))
BEGIN
    DECLARE studentAge INT;
    SELECT age INTO studentAge FROM Students WHERE id = studentId;
    
    IF studentAge < 18 THEN
        SET age_group = 'Minor';
    ELSE
        SET age_group = 'Adult';
    END IF;
END //
DELIMITER ;

-- Use it
CALL check_student_age(1, @group);
SELECT @group;

-- 3. Function: Calculate attendance percentage
DELIMITER //
CREATE FUNCTION calculate_attendance_percentage(studentId INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE total_days INT DEFAULT 0;
    DECLARE present_days INT DEFAULT 0;
    DECLARE percentage DECIMAL(5,2);

    SELECT COUNT(*) INTO total_days FROM Attendance WHERE student_id = studentId;
    SELECT COUNT(*) INTO present_days FROM Attendance WHERE student_id = studentId AND status = 'Present';

    IF total_days = 0 THEN
        SET percentage = 0;
    ELSE
        SET percentage = (present_days * 100.0 / total_days);
    END IF;

    RETURN percentage;
END //
DELIMITER ;

-- Use it
SELECT calculate_attendance_percentage(1) AS attendance_percent;
