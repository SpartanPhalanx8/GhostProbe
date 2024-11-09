<#
Comment-Based Help - Work in Progress
#>

param (
    [string]$Name
)

function Get-Greeting {
    <#
    .SYNOPSIS
        Generates a greeting message.

    .DESCRIPTION
        This function takes a name as input and returns a greeting message.

    .PARAMETER Name
        The name of the person to greet.

    .OUTPUTS
        System.String

    .EXAMPLE
        Get-Greeting -Name "Alice"
        This will return "Hello, Alice!".
    #>
    param (
        [string]$Name
    )

    return "Hello, $Name!"
}

# Call the function and display the greeting

$greeting = Get-Greeting -Name $Name
Write-Output $greeting
