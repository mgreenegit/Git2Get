# ModuleDev
This repo serves to test collaborative development of PowerShell DSC modules.  The modules in this repo are functional but do not provide any real configuration management.  Their sole purpose is to validate an authoring scenario.

Commits in the master branch are automatically packaged using a Web Hook from http://MyGet.org and made available in the web feed https://www.myget.org/F/greenenuget/Packages.

The modules can be installed using PowerShellGet.  To configure the repository as a trusted source, see the following snippet.
https://gist.github.com/mgreenegit/6f2a80eacb045505648e
