Database Setup – College Management System

This project uses MySQL as the database.
Follow the steps below to create the required database and tables before running the application.

🗄️ Create Database
CREATE DATABASE collegemanagement;
USE collegemanagement;

👨‍🎓 Student Authentication Table
CREATE TABLE student (
    prn VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100),
    password VARCHAR(255)
);

🏫 Student College Details
CREATE TABLE StudentCollegeDetails (
    student_prn INT(10) PRIMARY KEY,
    college_name VARCHAR(50),
    college_code VARCHAR(20),
    college_address VARCHAR(50),
    college_city VARCHAR(50),
    college_pin INT
);

🧍 Student Personal Details
CREATE TABLE StudentPersonalDetails (
    student_prn INT(10) PRIMARY KEY,
    student_fname VARCHAR(20),
    student_lname VARCHAR(50),
    student_gender VARCHAR(50),
    student_dob DATE,
    student_phone VARCHAR(15),
    student_aadhar VARCHAR(12),
    student_email VARCHAR(255),
    student_address VARCHAR(50),
    student_city VARCHAR(50),
    student_state VARCHAR(50),
    student_pin INT(6)
);

🎓 Student Academic Details
CREATE TABLE StudentAcademicDetails (
    student_prn INT(10) PRIMARY KEY,
    school_name VARCHAR(50),
    school_address VARCHAR(50),
    school_marks DECIMAL(5,2),
    school_grade VARCHAR(10),
    juniorcollege_name VARCHAR(255),
    juniorcollege_address VARCHAR(255),
    juniorcollege_marks DECIMAL(5,2),
    juniorcollege_grade VARCHAR(10)
);

📚 Student Course Details
CREATE TABLE StudentCourseDetails (
    student_prn INT(10) PRIMARY KEY,
    course_name VARCHAR(50),
    course_year VARCHAR(50),
    course_semester VARCHAR(50),
    course_admissiondate VARCHAR(15)
);

📖 Student Syllabus
CREATE TABLE studentsyllabus (
    deptno INT(10),
    dept_name VARCHAR(50),
    semester_no INT(20),
    subject_1 VARCHAR(50),
    subject_2 VARCHAR(50),
    subject_3 VARCHAR(50),
    subject_4 VARCHAR(50),
    subject_5 VARCHAR(50)
);

📝 Posts Data
CREATE TABLE post_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255),
    image LONGBLOB
);

🖼️ Gallery Posts
CREATE TABLE gallery1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prn VARCHAR(20),
    name VARCHAR(100),
    message VARCHAR(255),
    image LONGBLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

❤️ Gallery Likes
CREATE TABLE gallery_likes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    prn VARCHAR(20),
    UNIQUE(post_id, prn)
);

💬 Gallery Comments
CREATE TABLE gallery_comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    prn VARCHAR(20),
    name VARCHAR(100),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

🎓 Students Master Table
CREATE TABLE students (
    prn VARCHAR(20) PRIMARY KEY,
    student_name VARCHAR(100),
    admission_scheme VARCHAR(20)
);

💰 Fees Details
CREATE TABLE fees_details (
    prn VARCHAR(20),
    total_fees INT,
    paid_fees INT,
    pending_fees INT,
    last_paid_date DATETIME,
    deadline DATE,
    FOREIGN KEY (prn) REFERENCES students(prn)
);

📄 Documents Master
CREATE TABLE documents (
    doc_id INT AUTO_INCREMENT PRIMARY KEY,
    doc_name VARCHAR(100)
);

📁 Student Documents Status
CREATE TABLE student_documents (
    prn VARCHAR(20),
    doc_id INT,
    status VARCHAR(20), -- Submitted / Pending
    FOREIGN KEY (prn) REFERENCES students(prn),
    FOREIGN KEY (doc_id) REFERENCES documents(doc_id)
);

🏢 Office Guidelines
CREATE TABLE office_guidelines (
    guideline TEXT
);

📥 Default Documents Data
INSERT INTO documents (doc_name) VALUES
('Bonafide Certificate'),
('Fees Paid Slip'),
('Attendance Slip'),
('Original LC'),
('HOD Signature Application');
