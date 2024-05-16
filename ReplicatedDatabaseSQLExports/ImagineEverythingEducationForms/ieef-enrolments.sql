SELECT
	MSS_SCHOOL.SKL_SCHOOL_ID as SchoolId,
	MSS_SCHEDULE_MASTER.MST_OID as SectionId,	
	MSS_STUDENT.STD_ID_LOCAL as StudentNumber
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
	AND MSS_SCHOOL.SKL_SCHOOL_NAME NOT LIKE '%Home School%';