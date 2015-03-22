write-host '## BEGINNING OF PS BUILD SCRIPT ##'
$psversiontable
foreach ($dscModule in (Get-ChildItem .\ -filter *.psd1 -Recurse | % FullName)) {
    $moduleData = $dscModule | Test-ModuleManifest
    $env:PackageVersion = $($moduleData.Version)
    $NuSpec = Join-Path $moduleData.ModuleBase "$moduleData.nuspec"
@"
<?xml version="1.0"?>
<package xmlns="http://schemas.microsoft.com/packaging/2011/08/nuspec.xsd">
  <metadata>
    <id>$moduleData</id>
    <version>$($moduleData.Version)</version>
    <authors>$($moduleData.Author)</authors>
    <owners>$($moduleData.CompanyName)</owners>
    <requireLicenseAcceptance>false</requireLicenseAcceptance>
    <description>$($moduleData.Description)</description>
    <releaseNotes />
    <copyright>$($moduleData.Copyright)</copyright>
    <tags>PSModule PSIncludes_DscResource PSDscResource_$moduleData</tags>
  </metadata>
</package>
"@ | Out-File $NuSpec
& $env:NuGet pack $NuSpec -Version $($moduleData.Version) -Noninteractive
}
write-host '## END OF PS BUILD SCRIPT ##'