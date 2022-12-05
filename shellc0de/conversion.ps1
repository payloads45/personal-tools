# Import the required module
Import-Module ps2exe

# Get a list of all the PowerShell scripts in the current directory
$ps1Files = Get-ChildItem -Filter "*.ps1"

# Loop through each file
foreach ($file in $ps1Files) {
    # Convert the PowerShell script to an executable with the same name
    $outputFile = $file.FullName -replace ".ps1", ".exe"
    ps2exe -inputfile $file.FullName -outputfile $outputFile
}
