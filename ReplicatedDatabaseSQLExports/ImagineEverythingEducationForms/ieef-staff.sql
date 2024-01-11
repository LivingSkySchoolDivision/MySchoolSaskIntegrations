SELECT
	MSS_PERSON.PSN_EMAIL_01 as 'Email',
	STF_ID_LOCAL as 'ExtId',
	MSS_PERSON.PSN_NAME_LAST as 'LastName',
	MSS_PERSON.PSN_NAME_FIRST as 'FirstName',
    MSS_SCHOOL.SKL_SCHOOL_ID as 'SchoolIDs'
FROM
	MSS_STAFF
	LEFT OUTER JOIN MSS_SCHOOL ON STF_SKL_OID=MSS_SCHOOL.SKL_OID
	LEFT OUTER JOIN MSS_PERSON ON STF_PSN_OID=MSS_PERSON.PSN_OID
WHERE
	STF_STATUS = 'Active'
	AND MSS_SCHOOL.SKL_OID IS NOT NULL
	AND STF_ID_STATE IS NULL
ORDER BY 
	STF_NAME_VIEW ASC