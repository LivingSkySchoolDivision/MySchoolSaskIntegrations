param(
    [Parameter(Mandatory=$true)][string]$InputDemographicFileName,
    [Parameter(Mandatory=$true)][string]$InputContactsFileName,
    [Parameter(Mandatory=$true)][string]$OutputFileName
)

# This script builds a heirarchy of students in memory and outputs it to a new file.
# This may take a large amount of RAM if your files are huge.

# Check if input files exist

# Check that output file does not exist
if ((Test-Path $InputDemographicFileName) -ne $true)
{
    write-host "Input demographic file not found!"
    exit
}

if ((Test-Path $InputContactsFileName) -ne $true)
{
    write-host "Input contacts file not found!"
    exit
}

if ((Test-Path $OutputFileName) -eq $true)
{
    Remove-Item $OutputFileName
}

# Read in the list of students

write-host "Loading student demographic file..."
$StudentDemographicfile = import-csv $InputDemographicFileName
$MasterStudentList = @{}
foreach($Line in $StudentDemographicfile)
{
    $ThisStudent = [PSCustomObject]@{
        LegalFirstName = $Line.LegalFirstName
        LegalLastName = $Line.LegalLastName
        SchoolName = $Line.SchoolName
        SchoolAlias = $Line.SchoolAlias
        SchoolNumber = $Line.SchoolNumber
        LocalStudentNumber = $Line.LocalStudentNumber
        LearningID = $Line.LearningID
        Grade = $Line.Grade
        StudentOID = $Line.StudentOID
        Homeroom = $Line.Homeroom
        Contacts = @()
    }

    $MasterStudentList.add($ThisStudent.StudentOID, $ThisStudent)
}

# Read in the list of contacts and attach them to the students

write-host "Loading contacts file..."
$ContactsFile = import-csv $InputContactsFileName
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

$CSVLines = @()

foreach($StudentOID in $MasterStudentList.Keys)
{
    $Student = $MasterStudentList[$StudentOID]

    $HomeRoomValue = ""
    if ($Student.Homeroom.length -gt 0)
    {
        if ($Student.SchoolAlias.length -gt 0)
        {
            $HomeRoomValue = "$($Student.SchoolAlias)-$($Student.Homeroom)"
        } else {
            $HomeRoomValue = "$($Student.SchoolName)-$($Student.Homeroom)"
        }
    }

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
        Homeroom = $HomeRoomValue
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

$CSVLines | Sort-Object -Property @{Expression = "SchoolName"},@{Expression = "LegalLastName"} | export-csv $OutputFileName -NoTypeInformation -Delimiter ","
