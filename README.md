# ModuleDev
This repo serves to test collaborative development of PowerShell DSC modules.  The modules in this repo are functional but do not provide any real configuration management.  Their sole purpose is to validate a collaborative authoring scenario, and test build automation through [MyGet](http://MyGet.org).

## Build Script ##
The value in this repo is the [Build.ps1][Build] file.  This script is intended to be executed inside the MyGet build environment and handles three tasks:

* Identify the modules in this repo.
* Create .NuSpec XML files for each DSC Module.  The file contains meta data that NuGet uses to create the packaged form of the module.
* Run the NuGet executable within the build service to package each module.

Once the build service creates the NuGet package, it automatically pushes it to the test [web feed](https://www.myget.org/F/greenenuget/Packages).

## Web Hook ##
The connection between MyGet and GitHub is a [Webhook](http://docs.myget.org/docs/reference/webhooks) provided by MyGet.

## Consuming with PowerShellGet ##
The modules from the test webfeed can be installed using PowerShellGet.  To configure the repository, see the following [snippet](https://gist.github.com/mgreenegit/6f2a80eacb045505648e)
