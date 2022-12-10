class Software {
    [string]$Name
    [string]$Id
    [string]$Version
    [string]$AvailableVersion
}

$upgradeResult = winget upgrade --include-unknown | Out-String

$lines = $upgradeResult.Split([Environment]::NewLine)


# Find the line that starts with Name, it contains the header
$fl = 0
while (-not $lines[$fl].StartsWith("Nombre"))
{
    $fl++
}

# Line $i has the header, we can find char where we find ID and Version
$idStart = $lines[$fl].IndexOf("Id")
$versionStart = $lines[$fl].IndexOf("Versión")
$availableStart = $lines[$fl].IndexOf("Disponible")
$sourceStart = $lines[$fl].IndexOf("Origen")

# Now cycle in real package and split accordingly
$upgradeList = @()
For ($i = $fl + 1; $i -le $lines.Length; $i++) 
{
    $line = $lines[$i]
    if ($line.Length -gt ($availableStart + 1) -and -not $line.StartsWith('-'))
    {
        $name = $line.Substring(0, $idStart).TrimEnd()
        $id = $line.Substring($idStart, $versionStart - $idStart).TrimEnd()
        $version = $line.Substring($versionStart, $availableStart - $versionStart).TrimEnd()
        $available = $line.Substring($availableStart, $sourceStart - $availableStart).TrimEnd()
        $software = [Software]::new()
        $software.Name = $name;
        $software.Id = $id;
        $software.Version = $version
        $software.AvailableVersion = $available;

        $upgradeList += $software
    }
}


$upgradeList | Format-Table

$toSkip = @(
'ArtifexSoftware.GhostScript',
'Microsoft.VC++2013Redist-x64',
'MongoDB.Server',
"Microsoft.VC++2015-2019Redist-x64",
"Microsoft.VC++2015-2019Redist-x86",
"Microsoft.VC++2013Redist-x86",
"Microsoft.OneDrive")

foreach ($package in $upgradeList) 
{
    if (-not ($toSkip -contains $package.Id)) 
    {
        
        Write-Host "Going to upgrade package $package.id"
        & winget upgrade -h $package.id
    }
    else 
    {    
        Write-Host "Skipped upgrade to package $($package.id)"
    }
}