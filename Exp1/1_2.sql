CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Computer Science'),
(2, 'Mechanical Engineering'),
(3, 'Electrical Engineering'),
(4, 'Civil Engineering'),
(5, 'Mathematics');

INSERT INTO Courses (course_id, course_name, department_id) VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Machine Learning', 1),
(104, 'Thermodynamics', 2),
(105, 'Fluid Mechanics', 2),
(106, 'Circuits and Systems', 3),
(107, 'Control Systems', 3),
(108, 'Structural Analysis', 4),
(109, 'Linear Algebra', 5),
(110, 'Calculus', 5),
(111, 'Probability Theory', 5);

SELECT
    d.department_name,
    COUNT(c.course_id) AS number_of_courses
FROM
    Departments d
LEFT JOIN
    Courses c ON d.department_id = c.department_id
GROUP BY
    d.department_name
ORDER BY
    d.department_name;

SELECT
    d.department_name,
    COUNT(c.course_id) AS number_of_courses
FROM
    Departments d
JOIN
    Courses c ON d.department_id = c.department_id
GROUP BY
    d.department_name
HAVING
    COUNT(c.course_id) > 2
ORDER BY
    d.department_name;