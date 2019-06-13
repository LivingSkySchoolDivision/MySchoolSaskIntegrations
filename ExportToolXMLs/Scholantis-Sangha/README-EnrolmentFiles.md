Combining the two enrolment files together
==========================================

Sangha/Scholantis expects a single enrolment file, with both students and staff included in the same file. 

Since this isn't possible in a single export in MySchoolSask, you'll need to use a script to stick the two files together.

The "Scholantis-Enrolment-Students.xml" file contained in this repository does not include column headings, while the "Scholantis-Enrolment-Staff.xml" file does. To ensure that the CSV column headings are at the top of the file, make sure you add the "Staff" file first, then the "Student" file after.

Windows
-------

You can use the "type" windows command to concatenate a file onto another file:

```
type one.csv two.csv > combined.csv
```

Alternatively, you can use PowerShell:
```
get-content one.csv,two.csv | out-file combined.csv
```


Linux / Mac
-----------

Use the "cat" command in unix systems to concatenate a file onto another one:

```
cat one.csv two.csv > combined.csv
```