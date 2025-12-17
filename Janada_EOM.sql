use hope_alive_clinics;

--  List all upcoming appointments for a given patient (identified by surname and dob)
-- for all patients 
 select p.last_name, p.dob, a.status
 from 
 patients p
 join appointments a
 on p.patient_id = a.patient_id
 where a.status = 'Scheduled'
 ;
 -- for a given patient 'danladi' with dob '2022-09-26'
 select p.last_name, p.dob, a.status, a.appointment_date
 from 
 patients p
 join appointments a
 on p.patient_id = a.patient_id
 and a.status = 'Scheduled'
 where p.last_name = 'Danladi'
 and p.dob = '2022-09-26'
 ;

--  Show the number of patients assigned to each department.
select d.department_name, count(distinct p.patient_id) as Number_of_Patients
from patients p
join appointments a on p.patient_id = a.patient_id 
join doctors doc on a.doctor_id = doc.doctor_id
join departments d on doc.department_id = d.department_id
group by d.department_name
order by Number_of_Patients;

-- Retrieve all prescriptions given by all doctors in the last 6 months

select d.first_name as doctor_first_name,
d.last_name as doctor_last_name,
pr.prescription_id,
pr.drug_name,
pr.dosage,
a.appointment_date
from prescriptions pr
join appointments a on pr.appointment_id = a.appointment_id
join doctors d on a.doctor_id = d.doctor_id
where a.appointment_date >= date_sub(curdate(), interval 6 Month)
order by d.last_name, a.appointment_date desc;

-- Retrieve all prescriptions given by doctor Naomi Mohammed in the last 6 months
select d.first_name as doctor_first_name,
d.last_name as doctor_last_name,
pr.prescription_id,
pr.drug_name,
pr.dosage,
a.appointment_date
from prescriptions pr
join appointments a on pr.appointment_id = a.appointment_id
join doctors d on a.doctor_id = d.doctor_id
where d.first_name = 'Naomi'
and d.last_name = 'Mohammed'
and a.appointment_date >= date_sub(curdate(), interval 6 Month)
order by  a.appointment_date desc;

-- Find the top 3 doctors who had the highest number of appointments in the last year.
select d.first_name, d.last_name, count(a.appointment_id) as Total_Appointments
from appointments a
join doctors d on a.doctor_id = d.doctor_id
where a.appointment_date >= date_sub(curdate(), interval 1 year)
group by d.doctor_id, d.first_name, d.last_name
order by Total_Appointments desc
limit 3;



