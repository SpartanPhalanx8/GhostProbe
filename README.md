# readme.md

## GhostProbe.ps1

<img src=">

## whoami

GhostProbe is a PowerShell script designed to scan a range of ports of a specified IP address. 
It performs basic connectivity tests, stealth scans, and service banner grabbing to identify the 
status and version of services running on the ports.


## Current Features

**Port Scanning**                       Identifies open and closed ports within a specified range.
**Stealth Scanning**                    Provides an alternative scanning method to avoid detection.
**Service Version Identification**      Attempts to grab service banners to determine the version of services running on open ports.
**Verbose Output**                      Optionally provides detailed output during the scanning process.
**Multithreading**                      Utilizes jobs to perform scans in parallel for increased speed.


## Available Parameters

-ip                 The IP address to scan. Default is set to <127.0.0.1>
-startPort          The starting port number for the scan. Default is <1>
-endPort            The ending port number for the scan. Default is <1024>
-outputFile         The base name of the output file to save scan results. Default is "port_scan_results"
-outputFormat       The format of the output file. Options are "txt" or "xml". Default is currently set as "txt"
-Verbose            A switch to enable verbose output


## Usage

After downloading and saving the script, in order to run it you will need to open PowerShell as an administrator and navigate to the 
directory containing "GhostProbe.ps1". Ensure you have checked your version of Powershell is able to run scripts using the cmdlet:

"Get-ExecutionPolicy" or "Get-ExecutionPolicy -List"


## Caveat

If you need to amend policy restrictions I would first caveat the policy changes with ensuring the changes do not compromise your 
current system policies by allowing remote scripts to run on your system. I have listed the types of execution policies as follows:

**Restricted** Does not allow any scripts to run. This is the default execution policy for Windows client computers.

**AllSigned** Requires that all scripts and configuration files be signed by a trusted publisher, including scripts that you write on 
the local computer.

**RemoteSigned** Requires that all scripts and configuration files downloaded from the internet be signed by a trusted publisher. 
Scripts written on the local computer do not need to be signed.

**Unrestricted** Loads all configuration files and runs all scripts. If you run an unsigned script that was downloaded from the 
internet, you are prompted for permission before it runs.

**Bypass** Nothing is blocked, and there are no warnings or prompts. This policy is designed for configurations in which a PowerShell 
script is built into a larger application or for configurations in which PowerShell is used to perform a one-time task that is not 
part of a routine administrative script.

**Undefined** Removes the currently assigned execution policy from the current scope (current user, local machine, etc.). If the 
execution policy in all scopes is Undefined, the effective execution policy is Restricted, which is the default.

Once you are happy to go ahead you can set the execution policy for different scopes by specifying the -Scope parameter. The 
available scopes are:

Process         Affects only the current PowerShell session.

CurrentUser     Affects only the current user.

LocalMachine    Affects all users on the computer.

In this example the Set_ExecutionPolicy is set as RemoteSigned for the CurrentUser (which was the setting I used to test the 
script):

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser


## Ready to Run

Once you have everything ready, use the following command to run the script in your Powershell terminal:

.\GhostProbe.ps1 -ip "TARGET_IP_ADDRESS" -startPort CHOSEN_START_PORT -endPort CHOSEN_END_PORT -outputFile "FILE_NAME" -outputFormat "EITHER_txt_OR_xml" -Verbose

Be sure to include the " " when inserting the target IP address, the file name and file format. 
The port start and end parameters DO NOT require " ".
