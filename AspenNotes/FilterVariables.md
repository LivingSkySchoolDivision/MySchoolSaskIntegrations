# Filter Variables for input XML files
The following special variables can be used in export XML definitions.

## How to use
Example 1: Get daily attendance entries for _today_ only
```xml
<export table-id="tblStdAttend" header-row="true">
  <filter field="attDate" operator="equals" source="default" value="today" />
  ...
</export>
```

## Operators
* equals
* equalsIgnoreCase
* empty
* greaterThan
* greaterThanField
* greaterOrEqual
* lessThan
* lessThanField
* lessOrEqual
* notEmpty
* notEqual
* beginsWith
* contains
* endsWith
* in
* notIn
* after
* before
* onOrAfter
* onOrBefore
* ownable
* parentOwnable
* equalsOrganizations

## Dates 
* `today`
* `now`
* `lastOfWeek`
* `lastOfMonth`
* `firstOfWeek`
* `firstOfMonth`

## Unix epoch timestamps
Use these with fields that are timestamps rather than date or datetime data types.

A unix epoch timestamp is an integer representing the number of seconds that have passed since 00:00:00 on Thursday, January 1, 1970 UTC.

* `todayTimeStamp`
* `yesterdayTimeStamp`
* `firstOfWeekTimeStamp`
* `firstOfLastWeekTimeStamp`
* `firstOfMonthTimeSTamp`

## School information
* `schoolName`
* `schoolOid`
* `schoolStartGrade`
* `schoolEndGrade`


## Other
* `districtYear`
* `districtYearEnd`
* `districtYearStart`
* `currentGradeTerm`
* `currentGradeTerms`
* `newId`
* `newIncidentID`

## Can you export any of these values as a field in your export file?
No.
