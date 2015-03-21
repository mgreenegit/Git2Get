$nugetExe = if(Test-Path Env:NuGet) { Get-Content env:NuGet } else { Join-Path $solutionFolder ".nuget\nuget.exe" }

foreach ($dscModule in (Get-ChildItem .\ -filter *.psd1 -Recurse | % FullName)) {
    $moduleData = $dscModule | Test-ModuleManifest
    . $nugetExe pack $($moduleData.Name) -OutputDirectory .\Packages -NonInteractive -Version $($moduleData.version)
}