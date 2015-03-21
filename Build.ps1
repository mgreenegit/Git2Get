foreach ($dscModule in (Get-ChildItem .\ -filter *.psd1 -Recurse | % FullName)) {
    $moduleData = $dscModule | Test-ModuleManifest
    . $nugetExe pack $moduleData.Name -OutputDirectory .\Packages -NonInteractive -Version $moduleData.version
}