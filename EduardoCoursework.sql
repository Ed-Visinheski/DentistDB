/*
Student name: Eduardo Cook-Visinheski                    
*/
/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE TABLE addh189_Room(
    roomID VARCHAR(5) PRIMARY KEY,
    roomType VARCHAR(50) NOT NULL);
    
CREATE TABLE addh189_StaffPhone(
    phoneID VARCHAR(5) PRIMARY KEY,
    staffphone VARCHAR(11) NOT NULL);
    
CREATE TABLE addh189_StaffEmail(
    emailID VARCHAR(5) PRIMARY KEY,
    staffEmail VARCHAR(255) NOT NULL);
    
CREATE TABLE addh189_StaffBankDetails(
    bankID VARCHAR(5) PRIMARY KEY,
    accountName VARCHAR(130) NOT NULL,
    accountSortCode INTEGER(6) NOT NULL,
    accountNumber INTEGER(8) NOT NULL);

CREATE TABLE addh189_StaffNINo(
    nationalInsuranceID VARCHAR(5) PRIMARY KEY,
    staffNINo VARCHAR(9) NOT NULL);
    
CREATE TABLE addh189_PatientContactDetails(
    patientID VARCHAR(5) PRIMARY KEY,
    patientFName VARCHAR(50)NOT NULL,
    patientLName VARCHAR(80) NOT NULL,
    patientStreet VARCHAR(100) NOT NULL,
    patientCity VARCHAR(80) NOT NULL,
    patientPostcode VARCHAR(10) NOT NULL,
    patientPhone VARCHAR(11) NOT NULL,
    patientEmail VARCHAR(255));
    
CREATE TABLE addh189_MedicalRecord (
    medicalID VARCHAR(5) PRIMARY KEY,
    patientID VARCHAR(5) NOT NULL,
    patientSex CHAR(1) NOT NULL, 
    patientNationality VARCHAR(50) NOT NULL,
    patientDOB INTEGER(8) NOT NULL,
    patientBloodType VARCHAR(3),
    FOREIGN KEY (patientID) REFERENCES addh189_PatientContactDetails (patientID));    

CREATE TABLE addh189_Prescription(
    prescriptionID VARCHAR(5) PRIMARY KEY,
    patientID VARCHAR(5) NOT NULL,
    medicalID VARCHAR(5) NOT NULL,
    prescriptionName VARCHAR(100),
    prescriptionDose INTEGER(10),
    prescriptionStart INTEGER(8),
    prescriptionEnd INTEGER(8),
    FOREIGN KEY (medicalID) REFERENCES addh189_MedicalRecord (medicalID));
    
CREATE TABLE addh189_Staff(
    staffID VARCHAR(5) PRIMARY KEY,
    supervisorID VARCHAR(5),
    staffFName VARCHAR(50) NOT NULL,
    staffLName VARCHAR(80)NOT NULL,
    staffDOB INTEGER(8) NOT NULL,
    staffSex CHAR(1) NOT NULL,
    staffNationality VARCHAR(50) NOT NULL,
    phoneID VARCHAR(5) NOT NULL,
    emailID VARCHAR(5),
    staffStreet VARCHAR(100) NOT NULL,
    staffCity VARCHAR(80) NOT NULL,
    staffPostcode VARCHAR(10) NOT NULL,
    bankID VARCHAR(5) NOT NULL,
    nationalInsuranceID VARCHAR(5) NOT NULL,
    staffStartDate INTEGER(8) NOT NULL,
    FOREIGN KEY (phoneID) REFERENCES addh189_StaffPhone (phoneID),
    FOREIGN KEY (emailID) REFERENCES addh189_StaffEmail (emailID),
    FOREIGN KEY (bankID) REFERENCES addh189_StaffBankDetails (bankID),
    FOREIGN KEY (nationalInsuranceID) REFERENCES addh189_StaffNINo (nationalInsuranceID),
    FOREIGN KEY (supervisorID) REFERENCES addh189_Staff (staffID));
    
    
CREATE TABLE addh189_Dentist(
    dentistID VARCHAR(5) PRIMARY KEY,
    dentistSpecialisation VARCHAR(80) NOT NULL,
    dentistLevel VARCHAR(15) NOT NULL,
    yearsOfExperience INTEGER(2),
    FOREIGN KEY (dentistID) REFERENCES addh189_Staff (staffID));

CREATE TABLE addh189_Assistant(
    assistantID VARCHAR(5) PRIMARY KEY,
    assistantSpecialisation VARCHAR(80) NOT NULL,
    assistantLevel VARCHAR(15) NOT NULL,
    yearsOfExperience INTEGER(2),
    FOREIGN KEY (assistantID) REFERENCES addh189_Staff (staffID));
    
CREATE TABLE addh189_Appointment(
    appointmentID VARCHAR(5) PRIMARY KEY,
    dentistID VARCHAR(5) NOT NULL,
    patientID VARCHAR(5) NOT NULL,
    assistantID VARCHAR(5),
    roomID VARCHAR(5) NOT NULL,
    appointmentDate INTEGER(8) NOT NULL,
    appointmentTime INTEGER(4) NOT NULL,
    FOREIGN KEY (roomID) REFERENCES addh189_Room (roomID),
    FOREIGN KEY (dentistID) REFERENCES addh189_Dentist (DentistID),
    FOREIGN KEY (assistantID) REFERENCES addh189_Assistant (assistantID),
    FOREIGN KEY (patientID) REFERENCES addh189_PatientContactDetails (patientID));    

/* SECTION 2 - INSERT STATEMENTS */

INSERT INTO addh189_Room (roomID,roomType) VALUES
("R1","Exam Room"),
("R2","X-Ray Room"), 
("R3","Sterillization Room"),
("R4","Procedure Room"),
("R5","Consultation Room"),
("R6","Waiting Room"),
("R7","Staff Lounge"),
("R8","Supply Room"),
("R9","Records Room"),
("R10","Lab"),
("R11","Consultation Room"),
("R12","Exam Room"),
("R13","X-Ray Room");

INSERT INTO addh189_StaffPhone (phoneID,staffPhone) VALUES
("P1", "07415963278"),
("P2", "07512389746"),
("P3","07365987124"),
("P4","07312457896"),
("P5","07598123547"),
("P6","07854162739"),
("P7","07987654123"),
("P8","07458963278"),
("P9","07512389746"),
("P10","07312457896"),
("P11","07598123547"),
("P12","07854162739"),
("P13","07513254532"),
("P14","07532532532"),
("P15","07654776456"),
("P16","07584309020"),
("P17","07324532682"),
("P18","07950390235"),
("P19","07214008009"),
("P20","07490201490");

INSERT INTO addh189_StaffEmail (emailID,staffEmail) VALUES
("E1","sbrown@gmail.com"),
("E2","jacobthejohnson54@gmail.com"),
("E3","emilyJson@gmail.com"),
("E4","m.thompson@gmail.com"),
("E5","racheal.smith@gmail.com"),
("E6","davidjones@gmail.com"),
("E7","sarahjohnsonnn@gmail.com"),
("E8","michealSmithh@gmail.com"),
("E9","esunak89@gmail.com"),
("E10","davidbrown@gmail.com"),
("E11","rachealjonez@gmail.com"),
("E12","jamespthompson@gmail.com"),
("E13","judeallen@gmail.com"),
("E14","flicvbaker@gmail.com"),
("E15","libbbadamz@gmail.com"),
("E16","mmacasil@gmail.com"),
("E17","aksa.abraham@gmail.com"),
("E18","maxhurt@gmail.com"),
("E19","rublondon@gmail.com"),
("E20","rushenfernan@gmail.com");

INSERT INTO addh189_StaffBankDetails (bankID,accountName,accountSortCode,accountNumber) VALUES
("B1","Samantha Brown",123456,12345678),
("B2","Jacob Johnson", 123456,87654321),
("B3","Emily Williams",987654,23456789),
("B4","Micheal Thompson",987654,45678901),
("B5","Recheal Smith",345678,56789012),
("B6","David Jones",123456,34567890),
("B7","Sarah Johnson",987654,67890123),
("B8","Micheal Smith",345678,89012345),
("B9","Emily Sunak",123456,12345670),
("B10","David Brown",345678,23456789),
("B11","Racheal Johnson",987654,45678901),
("B12","James Thomspon",123456,67890123),
("B13","Jude Allen",123456,12383478),
("B14","Felicity Baker",654321,73894658),
("B15","Libby Adams",654321,64890566),
("B16","Mark Macasil",987654,78390997),
("B17","Aksa Abraham",654321,83674859),
("B18","Max Hurtado",987654,84726374),
("B19","Ruby London",654321,2920304),
("B20","Rushen Fernando",654321,99939299);

INSERT INTO addh189_StaffNINo (nationalInsuranceID,staffNINo) VALUES 
("I1","AB123456A"),
("I2","BC123456B"),
("I3","CD123456C"),
("I4","DE123456D"),
("I5","EF123456E"),
("I6","FG123456F"),
("I7","GH123456G"),
("I8","HI123456H"),
("I9","IJ123456I"),
("I10","JK123456J"),
("I11","KL123456K"),
("I12","LM123456L"),
("I13","JK123456J"),
("I14","PO124544T"),
("I15","KR123456R"),
("I16","BR122345R"),
("I17","FD123456S"),
("I18","DF213456R"),
("I19","TR123456T"),
("I20","AT123456A");

INSERT INTO addh189_PatientContactDetails (patientID,patientFName,patientLName,patientStreet,patientCity,patientPostcode,patientPhone,patientEmail) VALUES
("PA1","John","Smith","123 Main St.","London","SE50DS","07123456789","johnsmith@gmail.com"),
("PA2","Jane","Doe","456 Maple Ave.","London","SE70EF","07567812341","janedoe@gmail.com"),
("PA3","Bob","Johnson","789 Pine St.","London","SE120GH","07901234567","bobbyJohnson@gmai.com"),   
("PA4","Lisa","Williams","321 Oak St.","London","SE50FG","07812345678","lisawilliams@gmail.com"),     
("PA5","Alex","Thompson","159 Cedar Ave.","London","SE90HI","07123456789","alexthompson@gmail.com"),  
("PA6","Sarah","Jones","147 Birch St.","London","SE50HJ","07122456789","sarahjones@gmail.com"),  
("PA7","David","Brown","258 Cedar Ave.","London","SE1 5BW","07567812344","davidbrown@gmail.com"), 
("PA8","Rachel","Davis","369 Oak St.","London","SE17 1AT","07901234557","racheldavis@gmail.com"),   
("PA9","Mark","Taylor","159 Pine St.","London","SE17 1BB","07812346678","marktaylor@gmail.com"),   
("PA10","Emily","Anderson","147 Maple St.","London","SE14 3DX","07123456888","emilyanderson@gmail.com"),
("PA11","Michael","Jackson","456 Birch St.","London","SE1 5DJ","07122366789","eanderson@gmail.com"), 
("PA12","Melissa","Wilson","789 Cedar Ave.","London","SE15 5AJ","07567782341","melissawilson@gmail.com"),
("PA13","Christopher","Moore","	321 Pine St.","London","SE45TX","07903424567","christophermoore@gmail.com"),
("PA14","Jessica","Taylor","159 Pine St.","London","SE17 1BB","07812346678","marktaylor@gmail.com"),
("PA15","James","Anderson","147 Maple St.","London","SE14 3DX","07123456888","emilyanderson@gmail.com"),
("PA16","Emily","Smith","123 Main St.","London","SE50DS","07123456789","johnsmith@gmail.com");    

INSERT INTO addh189_MedicalRecord (medicalID,patientID,patientSex,patientNationality,patientDOB,patientBloodType) VALUES
("M1","PA1","M","British",19701221,"O+"),
("M2","PA2","F","British",19911012,"A+"),
("M3","PA3","M","Spanish",19570507,"B+"),
("M4","PA4","F","French	",19830918,NULL),
("M5","PA5","M","British",19940625,"O-"),
("M6","PA6","F","Spanish",19850302,NULL),
("M7","PA7","M","British",19760209,"B-"),
("M8","PA8","F","British",19970307,"AB-"),
("M9","PA9","M","French	",19690429,"O+"),
("M10","PA10","F","Irish",19790605,"A+"),
("M11","PA11","M","Iranian",19901221,"O+"),
("M12","PA12","F","British",19911012,"A+"),
("M13","PA13","M","Polish",19820507,"B+"),
("M14","PA14","F","Irish",20050918,NULL),
("M15","PA15","M","Irish",20060625,NULL),
("M16","PA16","F","British",20050302,NULL);

INSERT INTO addh189_Prescription (prescriptionID,patientID,medicalID,prescriptionName,prescriptionDose,prescriptionStart,prescriptionEnd) VALUES
("PR1",	"PA1","M1","Amoxicillin",500,20210305,20210930),
("PR2",	"PA2","M2","Azithromycin",250,20210115,20211101),
("PR3",	"PA3","M3","Ciprofloxacin",500,20210101,20210331),
("PR4",	"PA4","M4","Clarithromycin",250,20210120,20211123),
("PR5",	"PA5","M5","Sulfamethoxazole",400,20210718,20211223),
("PR6",	"PA6","M6","Erythromycin",250,20210101,20210930),
("PR8",	"PA8","M8","Moxifloxacin",400,20210101,20210930),
("PR9",	"PA9","M9","Penicillin",500,20210101,20210228),
("PR10","PA10","M10","Tetracycline",100,20210101,20210207),
("PR11","PA11","M11","Metronidazole",500,20210101,20210930),
("PR12","PA12","M12","Sulfamethoxazole",400,20210618,20211123),
("PR13","PA13","M13","Trimethoprim",200,20211125,20211130),
("PR14","PA14","M14","Vancomycin",500,20210101,20210930),
("PR16","PA16","M16","Amoxicillin",500,20210305,20210930);

INSERT INTO addh189_Staff (staffID,supervisorID,staffFName,staffLName,staffDOB,staffSex,staffNationality,phoneID,emailID,staffStreet,staffCity,staffPostcode,bankID,nationalInsuranceID,staffStartDate) VALUES
("S1",NULL,"Samantha","Brown",19920505,"F","British","P1","E1","123 Main St.","London","E2 9HA","B1","I1",20180601),
("S7","S1","Sarah","Johnson",19900720,"F","British","P7","E7","456 Elm St.","London","SW1 6AN","B7","I7",20170301),
("S2","S1","Jacob","Johnson",19900101,"M","British","P2","E2","456 Maple Ave.","London","SW1X 0AA","B2","I2",20180401),
("S3","S7","Emily","Williams",19910715,"F","British","P3","E3","789 Pine St.","London","SE1A 1AA","B3","I3",20170201),
("S4","S2","Michael","Thompson",19900307,"M","Italian","P4","E4","321 Oak St.","London","WC1B 3AA","B4","I4",20170401),
("S5","S2","Rachel","Smith",19911129,"F","British","P5","E5","159 Cedar Ave.","London","SE2N 5DU","B5","I5",20160101),
("S6","S2","David","Jones",19920618,"M","British","P6","E6","147 Birch St.","London","SW1B 3AA","B6","I6",20220201),
("S8","S7","Michael","Smith",19910315,"M","British","P8","E8","123 Oak Ave.","London","SE2 7BL","B8","I8",20170401),
("S9","S2","Emily","Sunak",19901115,"F","British","P9","E9","789 Maple St.","London","NE3 8CL","B9","I9",20170501),
("S10","S7","David","Brown",19900625,"M","Spanish","P10","E10","321 Pine Ave.","London","SE4 9DL","B10","I10",20170601),
("S11","S7","Rachel","Jones",19910905,"F","British","P11","E11","159 Cedar St.","London","SE5 0EL","B11","I11",20170701),
("S12","S2","James","Thompson",19920715,"M","French","P12","E12","147 Birch Ave.","London","SE16 1FL","B12","I12",20170608),
("S13","S2","Jude","Allen",19900324,"M","British","P13","E13","312 Main St.","London","SW2 9HA","B13","I13",20210724),
("S14","S2","Felicity","Baker",19890923,"F","South Korean","P14","E14","46 Maple Ave.","London","SW1X 0AA","B14","I14",20220430),
("S15","S7","Libby","Adams",19931211,"F","British","P15","E15","07 Pine St.","London","N1A 1AA","B15","I15",20160611),
("S16","S2","Mark","Macasil",19910226,"M","Phillipino","P16","E16","231 Oak St.","London","WC1B 3AA","B16","I16",20160829),
("S17","S7","Aksa","Abraham",19920418,"F","Indian","P17","E17","909 Cedar Ave.","London","SE2N 5DU","B17","I17",20190507),
("S18","S7","Max","Hurtado",19900923,"M","Spanish","P18","E18",	"57 Birch St.","London","SW1B 3AA","B18","I18",20181215),
("S19","S2","Ruby","London",19910508,"F","British","P19","E19",	"06 Elm St.","London","SW1 6AN","B19","I19",20190618),
("S20","S7","Rushen","Fernando",19910314,"M","Sri lankan","P20","E20","333 Oak Ave.","London","SE2 7BL","B20","I20",20170109);

INSERT INTO addh189_Dentist (dentistID,dentistSpecialisation,dentistLevel,yearsOfExperience) VALUES
("S1","Orthodontics","Senior",22),
("S3","General Dentistry","Junior",5),
("S7","Endodontics","Senior",20),
("S8","Prosthodontics","Junior",3),
("S10","Periodontics","Senior",12),
("S11","Oral and Maxillofacial Surgery","Junior",7),
("S15","Pediatric Dentistry","Senior",15),
("S17","Oral Medicine","Junior",4),
("S18","Oral Pathology","Senior",13),
("S20","Public Health Dentistry","Junior",8);

INSERT INTO addh189_Assistant (assistantID,assistantSpecialisation,assistantLevel,yearsOfExperience) VALUES
("S2","Pediatric Dentistry","Intermediate",15),
("S4","Orthodontics","Intermediate",7),
("S5","Endodontics","Intermediate",10),
("S6","Prosthodontics","Entry Level",1),
("S9","Periodontics","Intermediate",8),
("S12","Oral and Maxillofacial Surgery","Entry Level",3),
("S13","General Dentistry","Entry Level",2),
("S14","Oral Medicine","Entry Level",1),
("S16","Oral Pathology","Intermediate",11),
("S19","Public Health Dentistry","Entry Level",5);

INSERT INTO addh189_Appointment (appointmentID,dentistID,patientID,assistantID,roomID,appointmentDate,appointmentTime) VALUES
("A1","S1","PA1","S2","R11",20210601,0900),
("A2","S3","PA2","S4","R2",20210601,1000),
("A3","S7","PA3","S5","R3",20210601,1100),
("A4","S8","PA4","S6","R4",20210601,1200),
("A5","S10","PA5","S9","R11",20210601,1300),
("A6","S11","PA6","S12","R6",20210601,1400),
("A7","S15","PA7","S13","R7",20210601,1500),
("A8","S17","PA8","S14","R8",20210601,1600),
("A9","S18","PA9","S16","R9",20210601,1700),
("A10","S20","PA10","S19","R10",20210601,1800),
("A11","S10","PA11","S2","R11",20210602,0900),
("A12","S1","PA12","S4","R12",20210602,1000);

                     
/* SECTION 3 - UPDATE STATEMENTS */


UPDATE addh189_PatientContactDetails SET patientPhone="07739737964",patientEmail="emilysmith04@gmail.com"
WHERE patientID="PA16";

UPDATE addh189_Prescription SET prescriptionName="Moxifloxacin",prescriptionDose=400,prescriptionStart=20230101,prescriptionEnd=20230312
WHERE prescriptionID = "PR5";

/* SECTION 4 - SINGLE TABLE SELECT STATEMENTS */
/* 
1)  
List all appointment ID's, date and time of when the room R11 is in use ordered in ascending order of the date
*/
SELECT appointmentID,appointmentDate, appointmentTime  FROM addh189_Appointment WHERE roomID="R11"
ORDER BY appointmentDate ASC;
/* 
2)  
List the First Name, Last Name and Phone number of all patients whos name start with "J" ordering them in ascending order of their last name
*/
SELECT patientFName,patientLName,patientPhone FROM addh189_PatientContactDetails
WHERE patientFName LIKE "J%"
ORDER BY patientLName ASC;
/* 
3) 
List everything of all dentists with between 5 and 10 years of experience in descending order or their experience
*/
SELECT * FROM addh189_Dentist 
WHERE yearsOfExperience BETWEEN 5 AND 10
ORDER BY yearsOfExperience DESC;
/* 
4)  
List all patient postcodes in the South East region without dublicates
*/
SELECT DISTINCT patientPostcode FROM addh189_PatientContactDetails
WHERE patientPostcode LIKE "SE5%";
/* 
5)  
List The assistantID, their level and years of experience in ascending order of experience
*/
SELECT assistantID,assistantLevel,yearsOfExperience FROM addh189_Assistant
ORDER BY yearsOfExperience ASC;

/* 
6)  
Select everything from medical record when a patient does not have their blood type on record and was born after the 1st of the year 2000
*/

SELECT * FROM addh189_MedicalRecord
WHERE patientBloodType IS NULL AND patientDOB > 20000101;

/* SECTION 5 - MULTIPLE TABLE SELECT STATEMENTS */


/* 
1)  
As the prescription table is optional, list all the patientID's, their first and last name if they are currently on or have been on any prescriptions.
*/

SELECT patientID, patientFName, patientLName FROM addh189_PatientContactDetails
WHERE EXISTS (SELECT * FROM addh189_Prescription WHERE addh189_Prescription.patientID = addh189_PatientContactDetails.patientID)
ORDER BY patientLName ASC;

/* 
2)  
List all the patients first and last names and their phone numbers if they were born before 1986
*/
SELECT patientFName, patientLName,patientPhone FROM addh189_PatientContactDetails
WHERE EXISTS (SELECT * FROM addh189_MedicalRecord WHERE addh189_PatientContactDetails.patientID = addh189_MedicalRecord.patientID AND addh189_MedicalRecord.patientDOB < 19860101)
ORDER BY addh189_PatientContactDetails.patientFName ASC;

/* 
3)  
Select the phone number of all staff whom their first name start with R
*/

SELECT staffphone FROM addh189_StaffPhone
WHERE phoneID IN
(SELECT phoneID FROM addh189_Staff WHERE staffFName LIKE "R%"
ORDER BY staffLName);


/* 
4) 
List the staff first and last name and their phone number in descending order of phoneID
*/
SELECT addh189_Staff.staffFName, addh189_Staff.staffLName, addh189_StaffPhone.staffphone
FROM addh189_Staff
LEFT JOIN addh189_StaffPhone
ON addh189_Staff.phoneID = addh189_StaffPhone.phoneID
GROUP BY addh189_Staff.staffFName
ORDER BY addh189_StaffPhone.phoneID DESC;


/* 
5)  
List bank details, national insurance number,phone and email of the staff in ascending order of their bank account name
*/
SELECT addh189_StaffBankDetails.accountName, addh189_StaffBankDetails.accountSortCode, 
addh189_StaffBankDetails.accountNumber, addh189_StaffNINo.staffNINo, addh189_StaffEmail.staffEmail,addh189_StaffPhone.staffPhone
FROM addh189_StaffBankDetails
INNER JOIN addh189_Staff
ON addh189_Staff.bankID = addh189_StaffBankDetails.bankID
INNER JOIN addh189_StaffNINo
ON addh189_Staff.nationalInsuranceID = addh189_StaffNINo.nationalInsuranceID
INNER JOIN addh189_StaffPhone
ON addh189_Staff.phoneID = addh189_StaffPhone.phoneID
RIGHT JOIN addh189_StaffEmail
ON addh189_Staff.emailID = addh189_StaffEmail.emailID
ORDER BY addh189_StaffBankDetails.accountName ASC;


/* 
6)  
Get the bank details of all the staff living in the Eastern sections of London
*/
SELECT *
FROM addh189_StaffBankDetails
WHERE bankID IN
(SELECT bankID FROM addh189_Staff WHERE staffPostcode LIKE "_E%");


/* SECTION 6 - DELETE ROWS (make sure the SQL is commented out in this section)

DELETE FROM addh189_Appointment WHERE appointmentDate="20210601" AND appointmentTime="1100";
DELETE FROM addh189_Prescription WHERE prescriptionEnd < 20210501 OR prescriptionEnd IS NULL;

*/

/* SECTION 7 - DROP TABLES (make sure the SQL is commented out in this section)

DROP TABLE addh189_Room;
DROP TABLE addh189_StaffPhone;
DROP TABLE addh189_StaffEmail;
DROP TABLE addh189_StaffBankDetails;
DROP TABLE addh189_StaffNINo;
DROP TABLE addh189_PatientContactDetails;
DROP TABLE addh189_MedicalRecord;
DROP TABLE addh189_Prescription;
DROP TABLE addh189_Staff;
DROP TABLE addh189_Dentist;
DROP TABLE addh189_Assistant;
DROP TABLE addh189_Appointment;

*/