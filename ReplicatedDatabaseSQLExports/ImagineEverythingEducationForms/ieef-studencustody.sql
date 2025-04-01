SELECT
	MSS_STUDENT.STD_ID_STATE as StudentRegionId,
	CTJ_CNT_OID as ContactExtId,
	(CASE
		WHEN CTJ_FIELDA_001 IS NULL THEN 0
		ELSE CTJ_FIELDA_001
    END) as IsCustodial	
FROM
	MSS_STUDENT_CONTACT
	LEFT OUTER JOIN MSS_STUDENT ON MSS_STUDENT_CONTACT.CTJ_STD_OID=MSS_STUDENT.STD_OID


/*
    Regarding the "IsCustodial" field:
     ctjFieldA003 = "Legal Guardianship" 
     ctjFieldA001 = "ParentGuardian"
    LSSD uses ctjFieldA001 / "ParentGuardian", another district requested the additional field.
*/
