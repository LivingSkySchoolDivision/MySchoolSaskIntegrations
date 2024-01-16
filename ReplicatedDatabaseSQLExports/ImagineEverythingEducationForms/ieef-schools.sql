SELECT 
    SKL_SCHOOL_NAME as Name,
    SKL_SCHOOL_ID as ExtId,
    REPLACE(REPLACE(SKL_START_GRADE,-1,'PK'),0,'K') as LowGrade,
    (SKL_START_GRADE + SKL_NUMBER_OF_GRADES - 1) as HighGrade,
    SKL_SCHOOL_ID as SchoolNumber
FROM 
    MSS_SCHOOL
WHERE SKL_INACTIVE_IND = 0