# Requirements
 - Must be compliant with RFC 4180 (Note: MSS XML exports are _not_)
  - Escape single-quote characters with `""this is escaped""` not `\"this is escaped\"` 

## Contacts.csv: 
 - "Email": "Contact_email",
 - "ExtId": "Contact_sis_id",
 - "Phone": "Contact_phone",
 - "FullName": "Contact_name",
 - "PhoneType": "Contact_phone_type",
 - "Relationship": "Contact_relationship",
 - "StudentNumber": "Student_id"  -- Internal Living Sky student identifier 

## Enrolments.csv:
 - "SchoolId": "School_id",
 - "SectionId": "Section_id",
 - "StudentNumber": "Student_id" -- Internal Living Sky student identifier 

## Schools.csv: 
 - "Name": "School_name",
 - "ExtId": "School_id",
 - "LowGrade": "Low_Grade",
 - "HighGrade": "High_Grade",
 - "SchoolNumber": "School_number"

## Sections.csv:
 - "TermEnd": "Term_end",
 - "SchoolId": "School_id",
 - "Teacher1": "Teacher_id",
 - "Teacher2": "Teacher_2_id",
 - "Teacher3": "Teacher_3_id",
 - "TermName": "Term_name",
 - "SectionId": "Section_id",
 - "TermStart": "Term_start",
 - "CourseName": "Course_name",
 - "CourseNumber": "Course_Number",
 - "SectionNumber": "Section_number",
 - "CourseDescription": "Course_description"

## SpecEd.csv:
 - "Code": "Exceptionality_Code",
 - "Name": "Exceptionality",
 - "EndDate": "Exceptionality_End_Date",
 - "StartDate": "Execptionality_Start_Date",
 - "StudentRegionalCode": "Min_Number" -- ​Provincial student identifier
  
## Staff.csv: 
 - "Email": "Staff_email",
 - "ExtId": "Staff_id",
 - "LastName": "Last_name",
 - "FirstName": "First_name",
 - "SchoolIDs": "School_id"

The `staff.csv` file should only contain school-level staff such as principals, vice principals, counsellors, etc. 
Central office/District admin users do not need to be in any of these files.

## StuGuardianCustody.csv:
 - "StudentRegionId": "Student_number",  -- ​Provincial student identifier 
 - "ContactExtId": "Contact_sis_id",
 - "IsCustodial": "LegalGuardian"

## Students.csv:
 - "City": "Student_city", -- The city in which the student resides
 - "Email": "Student_email",
 - "Grade": "Grade",
 - "Phone": "Contact_phone",
 - "State": "Student_state",
 - "Street": "Student_street",
 - "LastName": "Last_name",
 - "SchoolId": "School_id",
 - "FirstName": "First_name",
 - "PhoneType": "Contact_phone_type",
 - "DateOfBirth": "DOB- date of birth",
 - "StudentNumber": "Student_id",  -- Internal Living Sky student identifier 
 - "StudentRegionId": "Student_number"  -- Provincial student identifier 

## Teachers.csv: 
 - "Email": "Teacher_email",
 - "ExtId": "Teacher_id",
 - "LastName": "Last_name",
 - "FirstName": "First_name",
 - "SchoolIDs": "School_id"

The `teachers.csv` file should only contain teachers.

## PASI_DATA.csv: 
 - "ProgramCode1": "GrantProgram1",
 - "ProgramCode2": "GrantProgram2",
 - "ProgramCode3": "GrantProgram3",
 - "EnrolmentCode1": "EnrolmentType1",
 - "EnrolmentCode2": "EnrolmentType2",
 - "EnrolmentCode3": "EnrolmentType3",
 - "FNMI": "FNMIDeclaration",
 - "StudentRegionId": "ASN"
​