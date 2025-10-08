param(
    [Parameter(Mandatory=$true)][string]$InputDemographicFileName,
    [Parameter(Mandatory=$true)][string]$InputContactsFileName,
    [Parameter(Mandatory=$true)][string]$OutputFileName
)

# This script enables the SchoolCash report to have multiple email addresses in the same field, separated by semicolens
# because the XML based export system is not capable of doing this on it's own.

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

# Read in the contacts file and make a dictionary to work with
$studentContactDictionary = @{}
foreach($Line in import-csv $InputContactsFileName -Delimiter ",")
{
    if ($studentContactDictionary.ContainsKey($Line.StudentPupilNo) -eq $false) {
        $studentContactDictionary[$Line.StudentPupilNo] = [System.Collections.ArrayList]::new()
    }

    if (($studentContactDictionary[$Line.StudentPupilNo] -contains $Line.Email) -eq $false)
    {
        [void]$studentContactDictionary[$Line.StudentPupilNo].Add($Line.Email)    
    }    
}

# Now read through the demographic file replacing the contact field
$updated = foreach($Line in import-csv $InputDemographicFileName -Delimiter "`t")
{
    $thisStudentContacts = ""
    if ($studentContactDictionary.ContainsKey($Line.Student_Number) -eq $true)
    {
        $thisStudentContacts = $studentContactDictionary[$Line.Student_Number] -join ';'
    }

    $Line.'Student_Parent/Guardian_Email' = $thisStudentContacts

    $Line
}

# Output to a new file
$updated | Export-Csv -Path $OutputFileName -NoTypeInformation -Delimiter "`t" -UseQuotes Never 
