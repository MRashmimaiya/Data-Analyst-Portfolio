CREATE DATABASE meditrack_db;
USE meditrack_db;

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(10),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    registration_date DATE
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(50),
    experience_years INT
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY,
    appointment_id INT,
    treatment_type VARCHAR(50),
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    appointment_id INT,
    payment_date DATE,
    amount_paid DECIMAL(10,2),
    payment_mode VARCHAR(20),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

INSERT INTO patients(patient_id,patient_name,gender,age,city, registration_date) VALUES
(1, 'Rahul Sharma', 'Male', 34, 'Delhi', '2023-01-15'),
(2, 'Anita Verma', 'Female', 29, 'Mumbai', '2023-02-10'),
(3, 'Suresh Kumar', 'Male', 45, 'Chennai', '2023-03-05'),
(4, 'Priya Nair', 'Female', 31, 'Bangalore', '2023-03-20'),
(5, 'Amit Patel', 'Male', 52, 'Null', '2023-04-12'),
(6, 'Neha Singh', 'Female', 27, 'Delhi', '2023-05-01'),
(7, 'Rohan Das', 'Male', 40, 'Null', '2023-05-18'),
(8, 'Kavita Iyer', 'Female', 36, 'Null', '2023-06-10'),
(9, 'Manoj Gupta', 'Male', 60, 'Null', '2023-06-25'),
(10, 'Sneha Kulkarni', 'Female', 33, 'Pune', '2023-07-05');

INSERT INTO doctors(doctor_id,doctor_name,specialization,experience_years) VALUES
(101, 'Dr. Mehta', 'Null', 15),
(102, 'Dr. Rao', 'Orthopedics', 10),
(103, 'Dr. Sen', 'Dermatology', 8),
(104, 'Dr. Kapoor', 'Neurology', 18),
(105, 'Dr. Malhotra', 'Pediatrics', 12),
(106, 'Dr. Fernandes', 'Null', 14),
(107, 'Dr. Banerjee', 'General Medicine', 20);

INSERT INTO appointments(appointment_id,patient_id,doctor_id,appointment_date,appointment_status) VALUES
(1001, 1, 101, '2023-04-01', 'Completed'),
(1002, 2, 102, '2023-04-02', 'Completed'),
(1003, 3, 103, '2023-04-03', 'Cancelled'),
(1004, 4, 104, '2023-04-05', 'Completed'),
(1005, 5, 101, '2023-04-10', 'Completed'),
(1006, 6, 105, '2023-04-15', 'Completed'),
(1007, 7, 107, '2023-04-20', 'Completed'),
(1008, 8, 106, '2023-04-22', 'Completed'),
(1009, 9, 102, '2023-04-25', 'Cancelled'),
(1010, 10, 103, '2023-04-28', 'Completed'),
(1011, 1, 101, '2023-05-05', 'Completed'),
(1012, 2, 105, '2023-05-10', 'Completed'),
(1013, 3, 107, '2023-05-15', 'Cancelled'),
(1014, 4, 104, '2023-05-18', 'Completed'),
(1015, 5, 101, '2023-05-20', 'Completed');

INSERT INTO treatments(treatment_id,appointment_id,treatment_type,treatment_cost) VALUES
(5001, 1001, 'Heart Checkup', 5000),
(5002, 1002, 'Knee Therapy', 3000),
(5003, 1004, 'Brain MRI', 0),
(5004, 1005, 'ECG', 2000),
(5005, 1006, 'Child Vaccination', 1500),
(5006, 1007, 'General Checkup', 0),
(5007, 1008, 'Prenatal Consultation', 0),
(5008, 1010, 'Skin Allergy Test', 1800),
(5009, 1011, 'Heart Follow-up', 4000),
(5010, 1012, 'Child Fever Treatment', 1200),
(5011, 1014, 'Neurology Consultation', 5000),
(5012, 1015, 'Angiography', 12000);

INSERT INTO payments(payment_id,appointment_id,
payment_date,amount_paid,
payment_mode) VALUES
(7001, 1001, '2023-04-01', 5000, 'Card'),
(7002, 1002, '2023-04-02', 3000, 'Cash'),
(7003, 1004, '2023-04-05', 8000, 'UPI'),
(7004, 1005, '2023-04-10', 2000, 'Null'),
(7005, 1006, '2023-04-15', 1500, 'Null'),
(7006, 1007, '2023-04-20', 1000, 'Cash'),
(7007, 1008, '2023-04-22', 3500, 'Null'),
(7008, 1010, '2023-04-28', 1800, 'Card'),
(7009, 1011, '2023-05-05', 4000, 'Null'),
(7010, 1012, '2023-05-10', 1200, 'Cash'),
(7011, 1014, '2023-05-18', 5000, 'Null'),
(7012, 1015, '2023-05-20', 12000, 'Card');

SELECT * FROM patients;
SELECT * FROM doctors;
SELECT * FROM appointments;
SELECT * FROM treatments;
SELECT * FROM payments;

SELECT * FROM patients WHERE city = 'Delhi';

SELECT * FROM appointments WHERE appointment_status = 'Completed';

SELECT specialization, SUM(amount_paid) AS revenue
FROM hospital_analysis
GROUP BY specialization;

SELECT * 
FROM patients 
WHERE city = 'Delhi' AND gender = 'Female';

SELECT * FROM doctors ORDER BY experience_years DESC;

SELECT DISTINCT specialization FROM doctors;

SELECT COUNT(*) FROM patients;

SELECT SUM(amount_paid) FROM payments;

SELECT AVG(age) FROM patients;

SELECT MIN(treatment_cost), MAX(treatment_cost) FROM treatments;

SELECT city, COUNT(*) AS total_patients
FROM patients
GROUP BY city;

SELECT city, COUNT(*) AS total_patients
FROM patients
GROUP BY city
HAVING COUNT(*) > 1;

SELECT 
    p.patient_name,
    a.appointment_date
FROM patients p
JOIN appointments a 
ON p.patient_id = a.patient_id;

SELECT 
    a.appointment_id,
    t.treatment_type
FROM appointments a
LEFT JOIN treatments t
ON a.appointment_id = t.appointment_id;

SELECT
    p.patient_name,
    d.doctor_name,
    t.treatment_cost
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN treatments t ON a.appointment_id = t.appointment_id;

SELECT 
    d.doctor_name,
    SUM(pay.amount_paid) AS revenue
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN payments pay ON a.appointment_id = pay.appointment_id
GROUP BY d.doctor_name
ORDER BY revenue DESC;

SELECT 
    patient_id,
    COUNT(*) AS visit_count
FROM appointments
GROUP BY patient_id
HAVING COUNT(*) > 1;

SELECT *
FROM doctors
WHERE experience_years > (
    SELECT AVG(experience_years) FROM doctors
);

CREATE VIEW hospital_analysis AS
SELECT
    a.appointment_id,
    a.appointment_date,
    p.patient_name,
    d.doctor_name,
    d.specialization,
    t.treatment_type,
    pay.amount_paid
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
LEFT JOIN treatments t ON a.appointment_id = t.appointment_id
LEFT JOIN payments pay ON a.appointment_id = pay.appointment_id
WHERE a.appointment_status = 'Completed';

SELECT * FROM hospital_analysis;

SELECT
    doctor_name,
    SUM(amount_paid) AS revenue,
    RANK() OVER (ORDER BY SUM(amount_paid) DESC) AS revenue_rank
FROM hospital_analysis
GROUP BY doctor_name;

SELECT *
FROM appointments a
LEFT JOIN payments p
ON a.appointment_id = p.appointment_id
WHERE p.amount_paid IS NULL;

