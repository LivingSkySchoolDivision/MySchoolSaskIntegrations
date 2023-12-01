param(
    [Parameter(Mandatory=$true)][string]$InputFileName,    
    [Parameter(Mandatory=$true)][string]$OutputFileName
)

# This script translates the high/low grade values in the input file to the appropriate values for the output file.

# Check if input file exist
if ((Test-Path $InputFileName) -ne $true)
{
    write-host "Input file not found!"
    exit
}

# Check that output file does not exist 
if ((Test-Path $OutputFileName) -eq $true)
{
    Remove-Item $OutputFileName
}

# Read in the list of schools
$SchoolFile = import-csv $InputFileName

# Process each school
$CSVLines = @()
foreach($Line in $SchoolFile)
{
    $ThisSchool = [PSCustomObject]@{
        Name = $Line.Name
        ExtId = $Line.ExtId
        LowGrade = $Line.LowGrade
        HighGrade = $Line.HighGrade
        SchoolNumber = $Line.SchoolNumber

        StartGrade = $Line.StartGrade
        NumGrades = $Line.NumGrades
    }

    # Translate StartGrade into LowGrade
    $ThisSchool.LowGrade = $ThisSchool.StartGrade
    if ($ThisSchool.LowGrade -eq "0") {
        $ThisSchool.LowGrade = "K"
    } elseif ($ThisSchool.LowGrade -eq "-1") {
        $ThisSchool.LowGrade = "PK"
    }

    # Translate StartGrade and NumGrades into HighGrade
    $ThisSchool.HighGrade = [int]$ThisSchool.StartGrade + [int]$ThisSchool.NumGrades - 1

    # Remove the STartGrade and NumGrades fields
    $ThisSchool.PSObject.Properties.Remove("StartGrade")
    $ThisSchool.PSObject.Properties.Remove("NumGrades")

    $CSVLines += $ThisSchool
}

$CSVLines | Sort-Object -Property @{Expression = "Name"}| export-csv $OutputFileName -NoTypeInformation -Delimiter ","