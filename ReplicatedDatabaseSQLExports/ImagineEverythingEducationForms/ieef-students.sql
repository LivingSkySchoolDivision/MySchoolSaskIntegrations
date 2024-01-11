/* 
    This query relies on making a temporary table on the SQL server and staging 
    some data in it to link in the later query. This is done because the SQL server
    has limits for how complex a query can be, and it is extremely easy to hit those
    limits (ie: by joining more than one table, for example).
    
    This method works around this limitation.
*/

-- Get the entire list of "Persons" and cache it in a temporary table.
SELECT
	MSS_PERSON.PSN_OID,
	MSS_PERSON_ADDRESS.ADR_CITY as 'City', -- City in which the student resides
	MSS_PERSON.PSN_EMAIL_01 as 'Email',
	MSS_PERSON.PSN_PHONE_01 as 'Phone',
	MSS_PERSON_ADDRESS.ADR_STATE as 'State',
	MSS_PERSON_ADDRESS.ADR_ADDRESS_LINE_01 as 'Street',
	MSS_PERSON.PSN_FIELDC_003 as 'LastName',
	MSS_PERSON.PSN_FIELDC_001 as 'FirstName',
	MSS_PERSON.PSN_DOB as 'DateOfBirth'
INTO #LSKYSD202_Temp_MSS_PERSON
FROM
	MSS_PERSON
	LEFT OUTER JOIN MSS_PERSON_ADDRESS ON MSS_PERSON.PSN_ADR_OID_PHYSICAL=MSS_PERSON_ADDRESS.ADR_OID;

-- Now get all the students, and link in the necesary info from the temporary table
SELECT	
	TEMP_PERSON.City as 'City', -- City in which the student resides
	TEMP_PERSON.Email as 'Email',
	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(STD_GRADE_LEVEL,'0K','K'),'01','1'),'02','2'),'03','3'),'04','4'),'05','5'),'06','6'),'07','7'),'08','8'),'09','9') as 'Grade',
	TEMP_PERSON.Phone as 'Phone',
	TEMP_PERSON.State as 'State',
	TEMP_PERSON.Street as 'Street',
	TEMP_PERSON.LastName as 'LastName',
	MSS_SCHOOL.SKL_OID as 'SchoolId',
	TEMP_PERSON.FirstName as 'FirstName',
	'Primary' as 'PhoneType',
	TEMP_PERSON.DateOfBirth as 'DateOfBirth',
	STD_ID_LOCAL as 'StudentNumber', -- Internal division student number
	STD_ID_LOCAL as 'StudentRegionId' -- Provincial student number
FROM
	MSS_STUDENT
	LEFT OUTER JOIN MSS_SCHOOL ON MSS_STUDENT.STD_SKL_OID=MSS_SCHOOL.SKL_OID
	LEFT OUTER JOIN #LSKYSD202_Temp_MSS_PERSON as TEMP_PERSON ON MSS_STUDENT.STD_PSN_OID=TEMP_PERSON.PSN_OID
WHERE
	STD_ENROLLMENT_STATUS IN ('Active', 'Active No Primary')
	AND MSS_SCHOOL.SKL_OID IS NOT NULL;

-- Clean up temporary table
DROP TABLE IF EXISTS #LSKYSD202_Temp_MSS_PERSON;