# ModuleDev
This repo serves to test collaborative development of PowerShell DSC modules, and automated "build" through [MyGet](http://MyGet.org).  Build in this case refers to extracting each DSC module from a Git repo (doesn't have to be GitHub) and automating test, packaging, and publishing to a source compatible with [PowerShellGet](https://technet.microsoft.com/en-us/library/dn835097(v=wps.640).aspx).  The modules in this repo are functional but do not provide any real configuration management.  Their sole purpose is to validate a scenario.

**Continuous Integration** - Multiple contributors to the repo merging their changes to the mainline as often as is needed.  Small improvements, low risk.

**Continuous Delivery** - This is a work in progress.  Right now the project only automates build.  At minimum the project would also need to include automating test of each module using [Pester](https://github.com/pester/Pester) or something like [Test-xDscResource](https://gallery.technet.microsoft.com/scriptcenter/xDscResourceDesigne-Module-22eddb29).  Additional work could include test scripts to automate module changes using VM's in Azure after commit but before push.

## Build Script ##
The unique value in this repo is the [Build.ps1](./Build.ps1) file.  This script is intended to be executed inside the MyGet build environment and handles three tasks:

* Identify the modules in this repo.
* Create .NuSpec XML files for each DSC Module.  The file contains meta data that NuGet uses to create the packaged form of the module.
* Run the NuGet executable within the build service to package each module.

Once the build service creates the NuGet package, it automatically pushes it to the test [web feed](https://www.myget.org/F/greenenuget/Packages).

## Webhook ##
The connection between MyGet and GitHub is a [Webhook](http://docs.myget.org/docs/reference/webhooks) provided by MyGet.  With the webhook enabled, GitHub makes a POST call to a web service hosted by MyGet that triggers the build action.  Configuring this is a "point and click" operation from the MyGet site.

[More information on Build Service from MyGet](http://docs.myget.org/docs/reference/build-services)

The build script should also be compatible with [TFS Online](http://docs.myget.org/docs/how-to/use-tfs-online-git-with-myget-build-services) if a webhook is configured to use it as a source.

## Consuming with PowerShellGet ##
Once the build has succeeded the packaged module files will be provided by MyGet in a NuGet package feed.  To intall the module, use [PowerShellGet](https://technet.microsoft.com/en-us/library/dn835097(v=wps.640).aspx).  To configure the repository, see the following [snippet](https://gist.github.com/mgreenegit/6f2a80eacb045505648e)
