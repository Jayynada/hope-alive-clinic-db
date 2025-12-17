use hope_alive_clinics;
select * from patients;
-- check for Mohammed Saleh born on '2023-08-12' upcoming appointments

 select a.appointment_date, p.last_name, p.dob
 from patients p
 left join appointments a on p.patient_id = a.patient_id
where p.last_name = 'Saleh' 
order by a.appointment_date asc;
