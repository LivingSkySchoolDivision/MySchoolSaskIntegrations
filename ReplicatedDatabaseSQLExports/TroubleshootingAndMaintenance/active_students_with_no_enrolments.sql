SELECT
	MSS_STUDENT.STD_OID as StudID,
	COUNT(*) as Count
INTO #LSKYSD202_Temp_STUD_ENROL_COUNTS	
FROM
	MSS_STUDENT
	LEFT OUTER JOIN MSS_STUDENT_SCHEDULE ON MSS_STUDENT.STD_OID=MSS_STUDENT_SCHEDULE.SSC_STD_OID	
	LEFT OUTER JOIN MSS_SCHEDULE_MASTER ON MSS_STUDENT_SCHEDULE.SSC_MST_OID=MSS_SCHEDULE_MASTER.MST_OID
	LEFT OUTER JOIN MSS_SCHEDULE ON MSS_SCHEDULE_MASTER.MST_SCH_OID=MSS_SCHEDULE.SCH_OID
	LEFT OUTER JOIN MSS_DISTRICT_SCHOOL_YEAR_CONTEXT ON MSS_SCHEDULE.SCH_CTX_OID=MSS_DISTRICT_SCHOOL_YEAR_CONTEXT.CTX_OID
	LEFT OUTER JOIN MSS_SCHOOL ON MSS_SCHEDULE.SCH_SKL_OID=MSS_SCHOOL.SKL_OID
WHERE
	MSS_STUDENT.STD_ENROLLMENT_STATUS IN ('Active', 'Active No Primary')
	AND MSS_DISTRICT_SCHOOL_YEAR_CONTEXT.CTX_FIELDA_001 = 'Current'
	AND MSS_SCHOOL.SKL_SCHOOL_NAME NOT LIKE '%Home School%'
GROUP BY 
	MSS_STUDENT.STD_OID

SELECT 
	MSS_SCHOOL.SKL_SCHOOL_NAME,
	MSS_STUDENT.STD_ID_LOCAL,	
	MSS_PERSON.PSN_NAME_FIRST,
	MSS_PERSON.PSN_NAME_LAST,
	#LSKYSD202_Temp_STUD_ENROL_COUNTS.Count as EnrolledClasses
INTO 
	#LSKYSD202_Temp_STUD_WITH_ZERO_ENROLS
FROM 
	MSS_STUDENT 	
	LEFT OUTER JOIN MSS_SCHOOL ON MSS_STUDENT.STD_SKL_OID=MSS_SCHOOL.SKL_OID
	LEFT OUTER JOIN MSS_PERSON ON MSS_STUDENT.STD_PSN_OID=MSS_PERSON.PSN_OID
	LEFT OUTER JOIN #LSKYSD202_Temp_STUD_ENROL_COUNTS ON MSS_STUDENT.STD_OID=#LSKYSD202_Temp_STUD_ENROL_COUNTS.StudID
WHERE 
	MSS_STUDENT.STD_ENROLLMENT_STATUS IN ('Active', 'Active No Primary')
	AND MSS_SCHOOL.SKL_OID IS NOT NULL
	AND MSS_SCHOOL.SKL_SCHOOL_NAME NOT LIKE '%Home School%'
ORDER BY 
	EnrolledClasses ASC
	;

SELECT 
	*
FROM
	#LSKYSD202_Temp_STUD_WITH_ZERO_ENROLS
WHERE
	#LSKYSD202_Temp_STUD_WITH_ZERO_ENROLS.EnrolledClasses IS NULL
ORDER BY
	#LSKYSD202_Temp_STUD_WITH_ZERO_ENROLS.SKL_SCHOOL_NAME ASC;

DROP TABLE IF EXISTS #LSKYSD202_Temp_STUD_ENROL_COUNTS;
DROP TABLE IF EXISTS #LSKYSD202_Temp_STUD_WITH_ZERO_ENROLS;