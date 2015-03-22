# ModuleDev
This repo serves to test collaborative development of PowerShell DSC modules.  The modules in this repo are functional but do not provide any real configuration management.  Their sole purpose is to validate an authoring scenario.

# Build Script
https://github.com/mgreenegit/ModuleDev/blob/master/Build.ps1

The value of this repo is found in the Build.ps1 file.  This script handles three tasks:
* Identify the modules in this repo.
* Create .NuSpec XML files for each DSC Module.  The file contains metdata that NuGet uses to create the packaged form of the module.
* Run the NuGet executable within the build service to package each module.

Once the build service creates the NuGet package, it autoamtically pushes it to the web feed.

# Web Hook
Commits in the master branch are automatically packaged using a Web Hook from http://MyGet.org and made available in the web feed https://www.myget.org/F/greenenuget/Packages.

# Consuming with PowerShellGet
The modules can be installed using PowerShellGet.  To configure the repository as a trusted source, see the following snippet.
https://gist.github.com/mgreenegit/6f2a80eacb045505648e
