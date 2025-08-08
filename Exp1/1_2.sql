CREATE TABLE University_Branches (
    branch_code INT PRIMARY KEY,
    branch_title VARCHAR(100) NOT NULL
);

CREATE TABLE Class_Listings (
    class_id INT PRIMARY KEY,
    class_subject VARCHAR(100) NOT NULL,
    branch_code INT,
    FOREIGN KEY (branch_code) REFERENCES University_Branches(branch_code)
);

INSERT INTO University_Branches (branch_code, branch_title) VALUES
(10, 'Computer Science'),
(20, 'Mechanical Engineering'),
(30, 'Electrical Engineering'),
(40, 'Civil Engineering'),
(50, 'Mathematics');

INSERT INTO Class_Listings (class_id, class_subject, branch_code) VALUES
(501, 'Data Structures', 10),
(502, 'Operating Systems', 10),
(503, 'Machine Learning', 10),
(504, 'Thermodynamics', 20),
(505, 'Fluid Mechanics', 20),
(506, 'Circuits and Systems', 30),
(507, 'Control Systems', 30),
(508, 'Structural Analysis', 40),
(509, 'Linear Algebra', 50),
(510, 'Calculus', 50),
(511, 'Probability Theory', 50);

SELECT
    branch.branch_title,
    COUNT(listing.class_id) AS number_of_classes
FROM
    University_Branches AS branch
LEFT JOIN
    Class_Listings AS listing ON branch.branch_code = listing.branch_code
GROUP BY
    branch.branch_title
ORDER BY
    branch.branch_title;

SELECT
    branch.branch_title,
    COUNT(listing.class_id) AS class_count
FROM
    University_Branches AS branch
JOIN
    Class_Listings AS listing ON branch.branch_code = listing.branch_code
GROUP BY
    branch.branch_title
HAVING
    COUNT(listing.class_id) > 2
ORDER BY
    branch.branch_title;