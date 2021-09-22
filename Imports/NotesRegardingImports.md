
# Notes regarding MySchoolSask automated imports
These are my notes on getting automated imports working for MSS. There may be other ways to do these tasks, but these are the ways that worked for me.



# File formatting and encoding issues
I found that import CSV files must meet the following criteria to be accepted by an MSS import.

## The CSV file must have a "heading" row, even though it is ignored.
The help text indicates that "No header row is expected or required". 
__If you don't include a header row, it will ignore the first row of your data__, so you need _something_ there, even though the system will ignore it. The headings do not need to match up with any real column names, as MSS imports are typically set up based on the order of the columns rather than column headings.

## The CSV file must be encoded UTF-8.
When using PowerShell to output a text file, I found that the default file encoding it was using was UTF-16. The import system does not know how to read this, and you will get errors indicating that it can't open the file.

In powershell, I accomplished this by adding `encoding uft8` to `Out-File`:

```
foreach ($Student in $Students) {
    "$($Student.PupilNo),$($Student.Email)" | Out-File $OutputFilename -Append -encoding utf8
}
```

## The CSV file must use LF line endings rather than the Windows default of CRLF.
I was getting the error "Missing value delimiter at position 1", and noticed that I would always get twice as many errors as I had lines in the input file. Changing line endings to "Unix Style" / "LF" fixed this issue.

In powershell, I accomplished this by adding `-NoNewline` flag to `Out-File`, and adding my own "`n" newline character to the end of each row:
```
foreach ($Student in $Students) {
    "$($Student.PupilNo),$($Student.Email)`n" | Out-File $OutputFilename -Append -NoNewline -encoding utf8
}
```


## Uploading at the right time
At the time of this writing, files uploaded to the SFTP server are moved to the MSS "import staging area" every 15 minutes, at 05, 20, 35, and 50 past the hour. You need to upload your file before one of these times, and set up the import to run after that time, so that the import job can actually see the file.



# Setting up an import step by step

