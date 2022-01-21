# This script builds a heirarchy of students in memory and outputs it to a new file.
# This may take a large amount of RAM if your files are huge.

$OutputFile = "testfile-output.txt"

# Read in the list of students

write-host "Loading student demographic file..."
$StudentDemographicfile = import-csv testfile-p1.txt
$MasterStudentList = @{}
foreach($Line in $StudentDemographicfile)
{
    $ThisStudent = [PSCustomObject]@{
        LegalFirstName = $Line.LegalFirstName
        LegalLastName = $Line.LegalLastName
        SchoolName = $Line.SchoolName
        SchoolNumber = $Line.SchoolNumber
        LocalStudentNumber = $Line.LocalStudentNumber
        LearningID = $Line.LearningID
        Grade = $Line.Grade
        StudentOID = $Line.StudentOID
        Contacts = @()
    }

    $MasterStudentList.add($ThisStudent.StudentOID, $ThisStudent)
}

# Read in the list of contacts and attach them to the students

write-host "Loading contacts file..."
$ContactsFile = import-csv testfile-p2.txt
$MasterContactsList = @()
foreach($Line in $ContactsFile)
{
    $ThisContact = [PSCustomObject]@{
        StudentOID = $Line.StudentOID
        StudentPupilNo = $Line.StudentPupilNo
        ContactID = $Line.ContactID
        Priority = $Line.Priority
        Relation = $Line.Relation
        FirstName = $Line.FirstName
        LastName = $Line.LastName
        Phone1 = $Line.Phone1
        Phone2 = $Line.Phone2
        Phone3 = $Line.Phone3
        Email = $Line.Email
        ReceivesEmail = $Line.ReceivesEmail
        PortalAccess = $Line.PortalAccess
        LivesWithStudent = $Line.LivesWithStudent
    }
    $MasterContactsList += $ThisContact
}

# Process and connect contacts to students
write-host "Processing..."

foreach($Contact in $MasterContactsList)
{
    if ($MasterStudentList.ContainsKey($Contact.StudentOID))
    {
        #$MasterStudentList[$Contact.StudentOID].Contacts.Add($Contact.ContactID,$Contact)
        $MasterStudentList[$Contact.StudentOID].Contacts += $Contact
    }
}

# Output a new csv file
write-host "Writing output file..."
$file = [system.io.file]::OpenWrite($OutputFile)
$writer = New-Object System.IO.StreamWriter($file)

$CSVLines = @()

foreach($StudentOID in $MasterStudentList.Keys)
{
    $Student = $MasterStudentList[$StudentOID]
    $CSVLine = [PSCustomObject]@{
        SchoolName = $Student.SchoolName
        SchoolNumber = $Student.SchoolNumber
        LocalStudentNumber = $Student.LocalStudentNumber
        LearningID = $Student.LearningID
        LegalLastName = $Student.LegalLastName
        LegalFirstName = $Student.LegalFirstName
        Grade = $Student.Grade
        Contact1Priority = ""
        EmergencyContact1Relation = ""
        EmergencyContact1FirstName = ""
        EmergencyContact1LastName = ""
        EmergencyContact1Phone1 = ""
        EmergencyContact1Phone2 = ""
        EmergencyContact1Phone3 = ""
        EmergencyContact1Email = ""
        EmergencyContact1ReceivesEmail = ""
        EmergencyContact1LivesWithStudent = ""
        Contact2Priority = ""
        EmergencyContact2Relation = ""
        EmergencyContact2FirstName = ""
        EmergencyContact2LastName = ""
        EmergencyContact2Phone1 = ""
        EmergencyContact2Phone2 = ""
        EmergencyContact2Phone3 = ""
        EmergencyContact2Email = ""
        EmergencyContact2ReceivesEmail = ""
        EmergencyContact2LivesWithStudent = ""
        Contact3Priority = ""
        EmergencyContact3Relation = ""
        EmergencyContact3FirstName = ""
        EmergencyContact3LastName = ""
        EmergencyContact3Phone1 = ""
        EmergencyContact3Phone2 = ""
        EmergencyContact3Phone3 = ""
        EmergencyContact3Email = ""
        EmergencyContact3ReceivesEmail = ""
        EmergencyContact3LivesWithStudent = ""
        BusRoute1 = ""
        BusRoute2 = ""
        AltBusRoute1 = ""
        AltBusRoute2 = ""
        Homeroom = ""
    }

    if ($Student.Contacts.Count -gt 0)
    {
        $Contact = $Student.Contacts[0]
        $CSVLine.Contact1Priority = $Contact.Priority
        $CSVLine.EmergencyContact1Relation = $Contact.Relation
        $CSVLine.EmergencyContact1FirstName = $Contact.FirstName
        $CSVLine.EmergencyContact1LastName = $Contact.LastName
        $CSVLine.EmergencyContact1Phone1 = $Contact.Phone1
        $CSVLine.EmergencyContact1Phone2 = $Contact.Phone2
        $CSVLine.EmergencyContact1Phone3 = $Contact.Phone3
        $CSVLine.EmergencyContact1Email = $Contact.Email
        $CSVLine.EmergencyContact1ReceivesEmail = $Contact.ReceivesEmail
        $CSVLine.EmergencyContact1LivesWithStudent = $Contact.ReceivesEmail
    }

    if ($Student.Contacts.Count -gt 1)
    {
        $Contact = $Student.Contacts[1]
        $CSVLine.Contact2Priority = $Contact.Priority
        $CSVLine.EmergencyContact2Relation = $Contact.Relation
        $CSVLine.EmergencyContact2FirstName = $Contact.FirstName
        $CSVLine.EmergencyContact2LastName = $Contact.LastName
        $CSVLine.EmergencyContact2Phone1 = $Contact.Phone1
        $CSVLine.EmergencyContact2Phone2 = $Contact.Phone2
        $CSVLine.EmergencyContact2Phone3 = $Contact.Phone3
        $CSVLine.EmergencyContact2Email = $Contact.Email
        $CSVLine.EmergencyContact2ReceivesEmail = $Contact.ReceivesEmail
        $CSVLine.EmergencyContact2LivesWithStudent = $Contact.ReceivesEmail
    }

    if ($Student.Contacts.Count -gt 2)
    {
        $Contact = $Student.Contacts[2]
        $CSVLine.Contact3Priority = $Contact.Priority
        $CSVLine.EmergencyContact3Relation = $Contact.Relation
        $CSVLine.EmergencyContact3FirstName = $Contact.FirstName
        $CSVLine.EmergencyContact3LastName = $Contact.LastName
        $CSVLine.EmergencyContact3Phone1 = $Contact.Phone1
        $CSVLine.EmergencyContact3Phone2 = $Contact.Phone2
        $CSVLine.EmergencyContact3Phone3 = $Contact.Phone3
        $CSVLine.EmergencyContact3Email = $Contact.Email
        $CSVLine.EmergencyContact3ReceivesEmail = $Contact.ReceivesEmail
        $CSVLine.EmergencyContact3LivesWithStudent = $Contact.ReceivesEmail
    }

    $CSVLines += $CSVLine
}

$CSVLines | Sort-Object -Property @{Expression = "SchoolName"},@{Expression = "LegalLastName"} | export-csv $OutputFile -NoTypeInformation -Delimiter ","
