Function Get-TargetResource
 {
	[OutputType([System.Collections.Hashtable])]
     param(
     [Parameter(Mandatory=$true)]
     [string]$Test
     )
     @{Test = $true}
}
 
 Function Set-TargetResource
 {
    param(
    [Parameter(Mandatory=$true)]
    [string]$Test
         )
         write-verbose 'This is a test!'
}
 
 Function Test-TargetResource
 {
    [OutputType([System.Boolean])]
    param(
    [Parameter(Mandatory=$true)]
    [string]$Test
         )
         $true
}

Export-ModuleMember -Function *-TargetResource