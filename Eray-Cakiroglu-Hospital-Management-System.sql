create table "Department" (
"id" serial not null,
"name" varchar not null); 
alter table "Department" add primary key("id");

create table "Doctor" (
"id" serial not null,
"name" varchar(255) not null,
"surname" varchar(255) not null,
"departmentId" bigint not null,
"birthDate" date not null,
"dailyAppointmentLimit" bigint not null
);
alter table "Doctor" add primary key("id");
alter table "Doctor" add constraint "doctor_departmentid_foreign" foreign key("departmentId") references "Department"("id");

create table "Patient"(
"id" serial not null,
"name" varchar(255) not null,
"surname" varchar(255) not null,
"birthDate" date not null,
"patientNumber" bigint not null);
alter table "Patient" add primary key("id");
alter table "Patient" add constraint "patients_patientnumber_unique" unique("patientNumber");

create table "Appointment"(
"id" serial not null,
"appointmentDate" date not null,
"startTime" time not null,
"endTime" time not null,
"doctorId" bigint not null);
alter table "Appointment" add primary key("id");
alter table "Appointment" add constraint "appointment_doctorid_foreign" foreign key("doctorId") references "Doctor"("id");

create table "DoctorSchedule"(
"id" serial not null,
"doctorId" bigint not null,
"availableDate" date not null,
"startTime" time not null,
"endTime" time not null,
"isActive" boolean not null);
alter table "DoctorSchedule" add primary key("id");
alter table "DoctorSchedule" add constraint "doctorschedule_doctorid_foreign" foreign key("doctorId") references "Doctor"("id");

create table "PatientAppointments"(
"id" serial not null,
"appointmentId" bigint not null,
"patientId" bigint not null);
alter table "PatientAppointments" add primary key("id");
alter table "PatientAppointments" add constraint "patientappointment_appointmentid_foreign" foreign key("appointmentId") references "Appointment"("id");
alter table "PatientAppointments" add constraint "patientappointment_patientid_foreign" foreign key("patientId") references "Patient"("id");

create table "PrescriptionDetail"(
"id" serial not null,
"details" varchar(255) not null);
alter table "PrescriptionDetail" add primary key("id");

create table "Prescription"(
"id" serial not null,
"prescriptionDetailsId" bigint not null,
"prescriptionDate" date not null);
alter table "Prescription" add primary key("id");
alter table "Prescription" add constraint "prescriptionDetailsId" foreign key("prescriptionDetailsId") references "PrescriptionDetail"("id");

create table "DoctorPrescriptions"(
"id" serial not null,
"prescriptionId" bigint not null,
"doctorId" bigint not null);
alter table "DoctorPrescriptions" add primary key("id");
alter table "DoctorPrescriptions" add constraint "doctorprescriptions_prescriptionid_foreign" foreign key("prescriptionId") references "Prescription"("id");
alter table "DoctorPrescriptions" add constraint "doctorprescriptions_doctorid_foreign" foreign key("doctorId") references "Doctor"("id");

create table "PatientPrescriptions"(
"id" serial not null,
"patientId" bigint not null,
"prescriptionId" bigint not null);
alter table "PatientPrescriptions" add primary key("id");
alter table "PatientPrescriptions" add constraint "patientprescriptions_patientid_foreign" foreign key("patientId") references "Patient"("id");
alter table "PatientPrescriptions" add constraint "patientprescriptions_prescriptionid_foreign" foreign key("prescriptionId") references "Prescription"("id");

create table "Medicine"(
"id" serial not null,
"name" varchar(255) not null);
alter table "Medicine" add primary key("id");

create table "PrescriptionMedicines"(
"id" serial not null,
"medicineId" bigint not null,
"prescriptionId" bigint not null);
alter table "PrescriptionMedicines" add primary key("id");
alter table "PrescriptionMedicines" add constraint "prescription_medicineid_foreign" foreign key("medicineId") references "Medicine"("id");
alter table "PrescriptionMedicines" add constraint "prescription_prescriptionid_foreign" foreign key("prescriptionId") references "Prescription"("id");

insert into "Department"("name") values
('Kardiyoloji'),
('Ortopedi'),
('Dahiliye'),
('Nöroloji'),
('Gastroenteroloji'),
('Dermatoloji'),
('Psikiyatri'),
('Göğüs Hastalıkları'),
('Endokrinoloji'),
('KBB'),
('Göz Hastalıkları'),
('Fizik Tedavi'),
('Üroloji'),
('Kadın Doğum'),
('Pediatri');

select * from "Department";

insert into "Doctor"("name","surname","departmentId","birthDate","dailyAppointmentLimit") values
('Ahmet','Yılmaz',1,'1980-01-10',20),
('Elif','Kaya',2,'1985-02-15',15),
('Mehmet','Demir',3,'1978-03-11',25),
('Selin','Arslan',4,'1982-04-12',18),
('Oğuz','Kurt',5,'1975-05-18',20),
('Eda','Çelik',6,'1990-06-05',12),
('Cihan','Koç',7,'1987-07-22',16),
('Hakan','Er',8,'1981-08-20',10),
('Gamze','Uslu',9,'1984-09-09',22),
('Bora','Güneş',10,'1979-10-30',15),
('Seda','Polat',11,'1988-11-14',25),
('Mert','Ayan',12,'1977-12-01',20),
('Zeynep','Aksoy',13,'1983-01-22',18),
('Kerem','Duman',14,'1986-02-07',21),
('Naz','Kalkan',15,'1991-03-16',15),
('Ferit','Sayın',1,'1976-11-25',15),
('Esra','Özdemir',6,'1993-05-10',18),
('Can','Yıldız',10,'1980-08-01',20),
('Dilek','Tunç',12,'1989-03-03',14),
('Murat','Şahin',3,'1974-12-19',22);

select * from "Doctor";

insert into "Patient" ("name","surname","birthDate") values
('Ali','Koç','1990-01-01'),
('Ayşe','Kurt','1988-02-14'),
('Zeynep','Çelik','1995-03-21'),
('Burak','Ergin','1992-04-10'),
('Sümeyye','Polat','1998-05-25'),
('Kemal','Yalçın','1985-06-30'),
('Seda','Bulut','1979-07-19'),
('Orhan','Dinç','1984-08-22'),
('Elvan','Koç','1996-09-01'),
('Merve','Şahin','2000-10-11'),
('Tuna','Er','2001-11-02'),
('Gamze','Bozkurt','1993-12-09'),
('Berk','Taylan','1987-01-06'),
('İlknur','Kaplan','1994-07-23'),
('Onur','Sert','1989-09-14'),
('Veli','Demli','1994-05-07'),
('Deniz', 'Aydın', '1990-10-20'), 
('Furkan', 'Öztürk', '1985-04-15'), 
('Gülçin', 'Şen', '2000-08-08'), 
('Ece','Yıldırım','1997-02-28'),  
('Mert','Akın','1982-11-11'),  
('Sena','Kara','1999-06-06'),  
('Yasin','Güler','1970-04-04'),    
('Pınar','Özer','1995-12-12'); 

select * from "Patient";

insert into "Medicine" ("name") values
('Aspirin'),
('Parol'),
('Majezik'),
('Amoksisilin'),
('Ventolin'),
('Cipro'),
('Lansor'),
('Prednol'),
('Xyzal'),
('Dideral'),
('Augmentin'),
('Voltaren'),
('Bepanthol'),
('Majezik Fort'),
('Coraspin');

select * from "Medicine";

insert into "PrescriptionDetail" ("details") values
('Günde 3 defa tok karnına'),
('Sabah akşam aç karnına'),
('Tek dozluk kullanım'),
('Gerektiğinde kullanın'),
('İlaç alerjisi kontrol edilmeli'),
('Kullanım sonrası 1 saat araç kullanılmamalı'),
('Akut durumda kullanılmalıdır'),
('14 gün sonra kontrol randevusu alınız'),
('Yemekten hemen önce alınacak'),
('Bol su ile içilmesi tavsiye edilir'),
('3 ay boyunca düzenli kullanım'),
('Sadece ağrı olduğunda'),
('Antibiyotik tedavisidir'),
('Göz damlası olarak kullanılacak'),
('Ciltte kızarıklık yaparsa kesiniz');

select * from "PrescriptionDetail";

insert into "DoctorSchedule" ("doctorId", "availableDate", "startTime", "endTime", "isActive") values
(1, '2025-12-01', '09:00:00', '17:00:00', true),
(2, '2025-12-01', '10:00:00', '16:00:00', true),
(3, '2025-12-01', '08:00:00', '18:00:00', true),
(4, '2025-12-01', '09:00:00', '13:00:00', true),
(5, '2025-12-01', '10:00:00', '15:00:00', true),
(1, '2025-12-02', '09:00:00', '17:00:00', true),
(4, '2025-12-02', '14:00:00', '18:00:00', true),
(4, '2025-12-03', '08:00:00', '17:00:00', true),
(1, '2025-12-03', '09:00:00', '17:00:00', true),
(2, '2025-12-03', '10:00:00', '16:00:00', true),
(5, '2025-12-04', '09:00:00', '16:00:00', true),
(3, '2025-12-04', '08:00:00', '18:00:00', true),
(4, '2025-12-04', '09:00:00', '13:00:00', true),
(6, '2025-12-05', '09:00:00', '12:00:00', true),
(15, '2025-12-05', '13:00:00', '17:00:00', true),
(5, '2025-12-05', '10:00:00', '15:00:00', true),
(7, '2025-12-06', '11:00:00', '15:00:00', true),
(8, '2025-12-06', '13:00:00', '17:00:00', true),
(9, '2025-12-07', '08:30:00', '16:30:00', true),
(10, '2025-12-07', '10:00:00', '14:00:00', true),
(11, '2025-12-08', '09:00:00', '17:00:00', true),
(12, '2025-12-08', '11:00:00', '16:00:00', true),
(13, '2025-12-09', '10:00:00', '18:00:00', true),
(14, '2025-12-09', '12:00:00', '16:00:00', true),
(16, '2025-12-10', '09:00:00', '15:00:00', true),
(17, '2025-12-10', '11:00:00', '17:00:00', true),
(18, '2025-12-11', '08:00:00', '16:00:00', true),
(19, '2025-12-11', '13:00:00', '17:00:00', true),
(20, '2025-12-12', '10:00:00', '18:00:00', true),
(1, '2025-12-12', '09:00:00', '17:00:00', true),
(2, '2025-12-13', '10:00:00', '16:00:00', true),
(3, '2025-12-13', '08:00:00', '18:00:00', true),
(4, '2025-12-14', '09:00:00', '13:00:00', true),
(5, '2025-12-14', '10:00:00', '15:00:00', true),
(11, '2025-12-15', '09:00:00', '17:00:00', true),
(12, '2025-12-16', '11:00:00', '16:00:00', true),
(13, '2025-12-17', '10:00:00', '18:00:00', true),
(14, '2025-12-18', '12:00:00', '16:00:00', true),
(16, '2025-12-19', '09:00:00', '15:00:00', true),
(17, '2025-12-20', '11:00:00', '17:00:00', true),
(18, '2025-12-21', '08:00:00', '16:00:00', true),
(19, '2025-12-22', '13:00:00', '17:00:00', true),
(20, '2025-12-23', '10:00:00', '18:00:00', true),
(1, '2025-12-24', '09:00:00', '17:00:00', true),
(2, '2025-12-25', '10:00:00', '16:00:00', true),
(3, '2025-12-26', '08:00:00', '18:00:00', true),
(4, '2025-12-27', '09:00:00', '13:00:00', true),
(5, '2025-12-28', '10:00:00', '15:00:00', true),
(6, '2025-12-29', '09:00:00', '12:00:00', true),
(7, '2025-12-30', '11:00:00', '15:00:00', true),
(8, '2025-12-31', '13:00:00', '17:00:00', true),
(20, '2025-12-01', '10:00:00', '16:00:00', true);

select * from "DoctorSchedule";

----Parametre olarak gelen doktor_id'sine ve gelen tarihe göre doktorun randevu sayısını gösteren fonksiyon.
create or replace function calculate_doctor_workload(doctor_id integer, test_date date)
returns integer
language plpgsql
as $$
declare
    monthly_appointment_count integer;
begin
    select count(*) into monthly_appointment_count
    from "Appointment"
    where "doctorId" = doctor_id
    and "appointmentDate" >= date_trunc('month', test_date)
    and "appointmentDate" <  date_trunc('month', test_date) + interval '1 month';

    return monthly_appointment_count;
end;
$$

select calculate_doctor_workload(1, '2025-12-10') as "Ahmet Yılmaz Aylık Randevu Sayısı";
select calculate_doctor_workload(4, '2025-12-01') as "Selin Arslan Aylık Randevu Sayısı";
select calculate_doctor_workload(16, '2025-12-01') as "Ferit Sayın Aylık Randevu Sayısı";
select calculate_doctor_workload(6, '2025-12-20') as "Eda Çelik Aylık Randevu Sayısı";

--Parametre olarak gelen doğum tarihinin yaşını hesaplayan fonksiyon.
create or replace function patient_age(birth_date date)
returns integer
language plpgsql
as $$
begin
	return date_part('year',age(birth_date)); 
end;
$$

select patient_age((select "birthDate" from  "Patient" where id = 2)) as "Hastanın Yaşı";
select patient_age((select "birthDate" from "Patient" where id = 3)) AS "Hastanın Yaşı";
select patient_age((select "birthDate" from "Patient" where id = 11)) AS "Hastanın Yaşı";
select patient_age((select "birthDate" from "Patient" where id = 13)) AS "Hastanın Yaşı";
select patient_age((select "birthDate" from "Patient" where id = 19)) AS "Hastanın Yaşı";
select patient_age((select "birthDate" from "Patient" where id = 25)) AS "Hastanın Yaşı";

--Parametre olarak gelen departman ile randevu zamanına göre müsaitliği olan doktorları listeleyen fonksiyon
create or replace function available_doctors(department_id integer, appointment_date date)
returns table (doctor_fullname varchar(255), department_name varchar(255))
language plpgsql
as $$
begin
	return query 
	select
        concat(d.name, ' ', d.surname)::varchar(255) as "Doktor Tam Adı",
        dep.name as "Departman Adı"
    from "Doctor" d
    inner join "Department" dep on d."departmentId" = dep.id
    inner join "DoctorSchedule" ds on ds."doctorId" = d.id
    where d."departmentId" = department_id
        and ds."availableDate" = appointment_date
        and ds."isActive" = true
        and (
			select count(a.id)
			from "Appointment" a
			where a."doctorId" = d.id
				and a."appointmentDate" = appointment_date) < d."dailyAppointmentLimit";

end;
$$

select * from available_doctors(3, '2025-12-01');
select * from available_doctors(1, '2025-12-01');
select * from available_doctors(1, '2025-12-03');
select * from available_doctors(10, '2025-12-11');
select * from available_doctors(9,'2025-12-07');

--It is a sequence structure that starts the patient number at one and increments it by one when each patient is added.
create sequence patient_num_seq
start with 1 
increment by 1;

--If the patient number is zero or not entered, it is the trigger function that assigns the next value to the last value in the database.
create or replace function set_patient_number()
returns trigger
language plpgsql
as $$
begin
    if new."patientNumber" is null or new."patientNumber" = 0 then
        new."patientNumber" := nextval('patient_num_seq');
    end if;
    
    return new;
end;
$$

--It is a trigger function that checks whether the patient number is assigned before adding the patient.
create  trigger trg_set_patient_number
before insert on "Patient"
for each row
execute function set_patient_number();

--THESE VALUES WERE LEFT FOR TESTING AND NOT ADDED.
insert into "Patient" ("name","surname","birthDate") values
('Nilay', 'Çınar', '1996-03-20'),
('Emre', 'Kara', '1987-11-15', 0),
('Ayhan', 'Özkan', '2001-08-05', 999);

--If the prescription date is not entered, it is the trigger function that assigns the current date as the prescription date.
create or replace function set_prescription_date()
returns trigger
language plpgsql
as $$
begin
	if new."prescriptionDate" is null then
		new."prescriptionDate" := current_date;
	end if;
	
	if new."prescriptionDate" > current_date then
		raise exception 'Vermiş olduğunuz (%s) tarih, ileri bir tarihtir. İleri bir tarih için reçete verilemez.', new."prescriptionDate";
	end if;
	return new;
end;
$$

insert into "Prescription" ("prescriptionDetailsId", "prescriptionDate") values (17, '2029-03-15');

--It is a trigger function that checks the assignment status of the prescription date before adding the prescription.
create trigger trg_set_prescription_date
before insert on "Prescription"
for each row
execute function set_prescription_date();


--It is the trigger function that controls the doctor's daily appointment limit when making an appointment with the doctor.
create or replace function check_doctor_appointment_daily_limit()
returns trigger
language plpgsql
as $$
declare
    appointment_count integer;
    doctor_limit integer;
    doctor_name varchar(255);
    doctor_surname varchar(255);
begin
    select "dailyAppointmentLimit","name","surname"
    into doctor_limit, doctor_name, doctor_surname
    from "Doctor"
    where id = NEW."doctorId";
    
    select count(*)
    into appointment_count
    from "Appointment"
    where "doctorId" = NEW."doctorId"
      and "appointmentDate" = NEW."appointmentDate";
    
    if appointment_count >= doctor_limit then
        raise exception 'Doktor %s %s''nın (%s) %s tarihli randevu limiti (%s) dolmuştur. Mevcut randevu sayısı: %s.',
            doctor_name, doctor_surname, NEW."doctorId", NEW."appointmentDate", doctor_limit, appointment_count;
    end if;

    return NEW;
end;
$$

--It is a trigger function that checks the doctor's daily appointment limit before making an appointment with the doctor.
create trigger trg_check_doctor_appointment_daily_limit
before insert on "Appointment"
for each row
execute function check_doctor_appointment_daily_limit();

--It is a stored procedure function that checks whether the appointment to be created is on the day the doctor works, within the working hours,
--whether there is another overlapping appointment, and whether it has exceeded its limit.
create or replace procedure sp_create_appointment(appointment_date date, start_time time, end_time time, doctor_id bigint, patient_id bigint)
language plpgsql
as $$
declare
    conflicting_appointment_count integer;
    doctor_daily_limit integer;
    appointment_count integer;
    schedule_start_time time;
    schedule_end_time time;
    new_appointment_id bigint;
begin
    if end_time <= start_time then
        raise exception 'Randevu bitiş saati (%), başlangıç saatinden (%) sonra olmalıdır.',
        end_time, start_time;
    end if;

    select ds."startTime", ds."endTime"
    into schedule_start_time, schedule_end_time
    from "DoctorSchedule" ds
    where ds."doctorId" = doctor_id
      and ds."availableDate" = appointment_date
      and ds."isActive" = true;

    if not found then
        raise exception 'Doktorun % tarihinde aktif bir çalışma planı bulunmamaktadır.',
        appointment_date;
    end if;

    if start_time < schedule_start_time or end_time > schedule_end_time then
        raise exception 'Randevu saatleri (%) doktorun çalışma aralığı (%) dışında kalmaktadır.',
            concat(start_time,' - ',end_time),
            concat(schedule_start_time,' - ',schedule_end_time);
    end if;

    select count(*)
    into conflicting_appointment_count
    from "Appointment" a
    where a."doctorId" = doctor_id
      and a."appointmentDate" = appointment_date
      and a."startTime" < end_time
      and a."endTime" > start_time;

    if conflicting_appointment_count > 0 then
        raise exception 'Seçilen saat aralığında doktorun çakışan bir randevusu bulunmaktadır.';
    end if;

    select d."dailyAppointmentLimit" 
    into doctor_daily_limit
    from "Doctor" d
    where d."id" = doctor_id;

    select count(*)
    into appointment_count
    from "Appointment" a
    where a."doctorId" = doctor_id
      and a."appointmentDate" = appointment_date;

    if appointment_count >= doctor_daily_limit then
        raise exception 'Doktor günlük randevu limitine ulaşmıştır (%).', doctor_daily_limit;
    end if;

    insert into "Appointment"("appointmentDate", "startTime", "endTime", "doctorId")
    values (appointment_date, start_time, end_time, doctor_id)
    returning id into new_appointment_id;

    insert into "PatientAppointments"("patientId", "appointmentId")
    values (patient_id, new_appointment_id);

end;
$$

call sp_create_appointment('2025-12-10', '14:20:00', '14:40:00', 16, 19);
call sp_create_appointment('2025-12-08', '14:00:00', '14:30:00', 1, 5);
call sp_create_appointment('2025-12-12', '11:00:00', '11:30:00', 1, 6);


--This function allows the doctor to prescribe medications to the patient, including the details of each medication, on a specific date.
create or replace procedure sp_create_prescription(prescription_date date,doctor_id bigint,patient_id bigint,details varchar(255),medicine_ids bigint[])
language plpgsql
as $$
declare
	detail_id bigint;
	prescription_id bigint;
	med_id bigint;
begin

	if prescription_date > current_date then
        raise exception 'İleri bir tarih (%s) için reçete verilemez.', prescription_date;
    end if;
	
	insert into "PrescriptionDetail"("details")
	values (details)
	returning id into detail_id;

	insert into "Prescription"("prescriptionDetailsId", "prescriptionDate")
	values (detail_id, prescription_date)
	returning id into prescription_id;

	insert into "DoctorPrescriptions"("prescriptionId", "doctorId")
	values (prescription_id, doctor_id);
	
    insert into "PatientPrescriptions"("prescriptionId", "patientId")
    values (prescription_id, patient_id);

	foreach med_id in array medicine_ids
    loop
        insert into "PrescriptionMedicines"("medicineId", "prescriptionId")
        values (med_id, prescription_id);
    end loop;
end;
$$


call sp_create_prescription(current_date, 1, 3, 'Kan sulandırıcı ve ağrı yönetimi.', array[1, 15]);
call sp_create_prescription(current_date, 3, 8, '60 gün boyunca aç karnına.', array[7]);
call sp_create_prescription(current_date, 4, 5, 'Migren atakları için kullanın.', array[10]);
call sp_create_prescription(current_date, 2, 16, 'Sabah/akşam kas gevşetici.', array[3, 12]);
call sp_create_prescription(current_date, 5, 9, 'Mide koruyucu ve antibiyotik.', array[7, 6]);
call sp_create_prescription(current_date, 6, 26, 'Cilt kuruluğu ve alerji.', array[13, 9]);
call sp_create_prescription(current_date, 11, 22, 'Güçlü antibiyotik tedavisi.', array[11]);
call sp_create_prescription(current_date, 15, 11, 'Ateş düşürücü ve çocuk dozu antibiyotik.', array[2, 4]);
call sp_create_prescription(current_date, 16, 12, 'Kombine ağrı ve inflamasyon tedavisi.', array[1, 3, 12]);
call sp_create_prescription(current_date, 17, 20, 'Şiddetli alerjik reaksiyon için.', array[9]);
call sp_create_prescription(current_date, 20, 23, 'Kontrol amaçlı kan sulandırıcı.', array[1, 15]);
call sp_create_prescription(current_date, 10, 14, 'Boğaz enfeksiyonu için.', array[4]);
call sp_create_prescription(current_date, 7, 10, 'Göz çevresi için nemlendirici.', array[13]);
call sp_create_prescription(current_date, 12, 18, 'Fizik tedavi sonrası kas bakımı.', array[12, 14]);
call sp_create_prescription(current_date, 13, 4, 'İhtiyaç duyulduğunda sakinleştirici.', array[10]);

--It is a view that shows the number of appointments of doctors along with their departments.
create or replace view vw_doctor_department_appointment_count as
select 
concat(d.name,' ',d.surname) as "Doktorun Tam Adı",
dept.Name as "Departman",
count(a.id) as "Randevu Sayısı"
from "Doctor" d
left join "Department" dept on dept.id = d."departmentId"
left join "Appointment" a on a."doctorId" = d.id
group by d.id, d.name, d.surname, dept.Name;

--View showing patients' appointment dates, appointment start and end times, and the doctors they have appointments with, along with their departments
create or replace view vw_patient_detail_appointment as
select
concat(p.name,' ',p.surname) as "Hasta Tam Adı",
a."appointmentDate" as "Randevu Tarihi",
a."startTime" as "Randevu Başlangıç Saati",
a."endTime" as "Randevu Bitiş Saati",
concat(d.name,' ',d.surname) as "Doktorun Tam Adı",
dept.name as "Doktorun Departmanı"
from "Patient" p 
join "PatientAppointments" pa on p.id = pa."patientId"
join "Appointment" a on pa."appointmentId" = a.id
join "Doctor" d on a."doctorId" = d.id 
join "Department" dept on dept.id = d."departmentId" 
order by p.id,a."appointmentDate",a."startTime";

--This query gives the total number of patients and the average appointment times of patients by department.
select
    dept."name" as "Departman Adı",
    count(distinct pa."appointmentId") as "Toplam Hasta Sayısı",
    avg(a."endTime" - a."startTime") as "Ortalama Randevu Süresi"
from "Department" dept
join "Doctor" d on d."departmentId" = dept.id
join "Appointment" a on a."doctorId" = d.id 
join "PatientAppointments" pa on pa."appointmentId" = a.id
group by dept."name"
order by "Toplam Hasta Sayısı" desc;

--This query gives the number of drugs most frequently prescribed.
select
m.name as "İlaç Adı",
count(pm."medicineId") as "Toplam Reçete Sayısı"
from "Prescription" p
join "PrescriptionMedicines" pm on p.id = pm."prescriptionId"
join "Medicine" m on m.id = pm."medicineId" 
group by m.name
having count(pm."medicineId") > 0
order by "Toplam Reçete Sayısı" desc;

--This query returns doctors who have more appointments than average in departments.
select 
concat(d."name",' ', d.surname ) as "Doktorun Tam Adı",
dep.name as "Departman Adı",
count(a.id) as "Randevu Sayısı"
from "Doctor" d 
join "Appointment" a on a."doctorId" = d.id 
join "Department" dep on dep.id = d."departmentId" 
group by d.id, d."name", d.surname, dep."name" 
having count(a.id) > (
select avg(appointment_count)
from (
	select count(id) as appointment_count 
	from "Appointment" group by "doctorId") as doctor_appointment_counts
	)
order by "Randevu Sayısı" desc;