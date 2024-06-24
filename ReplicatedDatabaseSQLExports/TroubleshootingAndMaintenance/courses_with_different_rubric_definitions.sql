/*
    Gets all courses ACTIVELY BEING USED BY AT LEAST ONE SECTION and returns some info on the courses
    including the rubric definition information.
*/

/* Get all the courses that are in use */
SELECT
	DISTINCT MSS_COURSE_SCHOOL.CSK_OID
INTO #LSKYSD202_Temp_COURSE_TROUBLESHOOTING
FROM
	MSS_SCHEDULE_MASTER
	LEFT OUTER JOIN MSS_SCHEDULE ON MSS_SCHEDULE_MASTER.MST_SCH_OID=MSS_SCHEDULE.SCH_OID
	LEFT OUTER JOIN MSS_DISTRICT_SCHOOL_YEAR_CONTEXT ON MSS_SCHEDULE.SCH_CTX_OID=MSS_DISTRICT_SCHOOL_YEAR_CONTEXT.CTX_OID
	LEFT OUTER JOIN MSS_COURSE_SCHOOL ON MSS_SCHEDULE_MASTER.MST_CSK_OID=MSS_COURSE_SCHOOL.CSK_OID
WHERE
	MSS_DISTRICT_SCHOOL_YEAR_CONTEXT.CTX_FIELDA_001 = 'Current'
	AND MSS_COURSE_SCHOOL.CSK_COURSE_NUMBER NOT IN ('FASA', 'NAC', 'ATT-PM', 'ATT-AM')
ORDER BY CSK_OID;


/* Now get info on those specific courses */
SELECT 
	MSS_SCHOOL.SKL_SCHOOL_NAME as School,
	MSS_COURSE_SCHOOL.CSK_COURSE_NUMBER as CourseCode,
	MSS_COURSE_SCHOOL.CSK_COURSE_DESCRIPTION as Course,
	MSS_COURSE_SCHOOL.CSK_SHORT_DESCRIPTION as CourseShort,
	MSS_COURSE_SCHOOL.CSK_GRADE_LEVEL as Grade,
	CSK_RBD_OID as RubricDefID,
	RBD_NAME as RubricDefinition
FROM 
	#LSKYSD202_Temp_COURSE_TROUBLESHOOTING
	LEFT OUTER JOIN MSS_COURSE_SCHOOL ON #LSKYSD202_Temp_COURSE_TROUBLESHOOTING.CSK_OID=MSS_COURSE_SCHOOL.CSK_OID
	LEFT OUTER JOIN MSS_SCHOOL ON MSS_COURSE_SCHOOL.CSK_SKL_OID=MSS_SCHOOL.SKL_OID
	LEFT OUTER JOIN MSS_RUBRIC_DEFINITION ON MSS_COURSE_SCHOOL.CSK_RBD_OID=MSS_RUBRIC_DEFINITION.RBD_OID
ORDER BY 
	MSS_COURSE_SCHOOL.CSK_COURSE_DESCRIPTION ASC,
	MSS_SCHOOL.SKL_SCHOOL_NAME DESC;
	
/* Now clean up */    
DROP TABLE IF EXISTS #LSKYSD202_Temp_COURSE_TROUBLESHOOTING;