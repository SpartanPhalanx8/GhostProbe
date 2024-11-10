# readme.md

## GhostProbe.ps1

<img src="Images/GhostProbe application logo.png">

<div id="header" align="center">
  <h1>Welcome to my project - GhostProbe</h1>
 </div>

<div id="badges">
  <a href="https://www.linkedin.com/in/wh1tehat/">
    <img src="https://img.shields.io/badge/LinkedIn-blue?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn Badge"/>
  </a>
  <a href="https://www.reddit.com/user/G00nW1zard/">
    <img src="https://img.shields.io/badge/Reddit-FF4500?style=for-the-badge&logo=reddit&logoColor=white"/>
  </a>
  <a href="https://www.facebook.com/profile.php?id=100086234683818"/>
    <img src="https://img.shields.io/badge/Facebook-1877F2?style=for-the-badge&logo=facebook&logoColor=white"/>
  </a>
  <a href="https://www.github.com/SpartanPhalanx8"/>
    <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"/>
  </a>
  <img src="https://img.shields.io/badge/Kali_Linux-557C94?style=for-the-badge&logo=kali-linux&logoColor=white"/>
  <img src="https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=Tableau&logoColor=white"/>
  <img src="https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=black"/>
  <img src="https://img.shields.io/badge/hyperledger-2F3134?style=for-the-badge&logo=hyperledger&logoColor=white"/>
</div>

## whoami

GhostProbe is a PowerShell script designed to scan a range of ports of specified IP addresses. 
It performs basic connectivity tests, stealth scans, and service banner grabbing to identify the 
status and versions of services running on the ports.


## Current Features

**Port Scanning** -                       Identifies open and closed ports within a specified range.

**Stealth Scanning** -                    Provides an alternative scanning method to avoid detection.

**Service Version Identification** -     Attempts to grab service banners to determine the version of services running on open ports.

**Verbose Output** -                     Optionally provides detailed output during the scanning process.

**Multithreading** -                      Utilises multi tasks to perform scans in parallel for increased speed.


## Available Parameters

-ip &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&thinsp;*The IP address to scan. Default is set to <127.0.0.1>*

-startPort&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&thinsp;*The starting port number for the scan. Default is <1>*

-endPort&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&thinsp;*The ending port number for the scan. Default is <1024>*

-outputFile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&thinsp;*The base name of the output file to save scan results. Default is "port_scan_results"*

-outputFormat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&thinsp;*The format of the output file. Options are "txt" or "xml". Default is currently set as "txt"*

-Verbose&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&thinsp;*A switch to enable verbose output*


## Usage

After downloading and saving the script, in order to run it you will need to open PowerShell as an administrator and navigate to the 
directory containing "GhostProbe.ps1". Ensure you have checked your version of Powershell is able to run scripts using the cmdlet:

"Get-ExecutionPolicy" or "Get-ExecutionPolicy -List"


## Caveat

If you need to amend policy restrictions I would first caveat the policy changes with this prior warning. Ensure the changes DO NOT 
compromise your current system policies by allowing remote scripts to run on your system. I have listed the types of execution policies 
as follows:

**Restricted** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Does not allow any scripts to run. This is the default execution policy for Windows client computers.

**AllSigned** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Requires that all scripts and configuration files be signed by a trusted publisher, including scripts that you write on 
the local computer.

**RemoteSigned** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Requires that all scripts and configuration files downloaded from the internet be signed by a trusted publisher. 
Scripts written on the local computer do not need to be signed.

**Unrestricted** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loads all configuration files and runs all scripts. If you run an unsigned script that was downloaded from the 
internet, you are prompted for permission before it runs.

**Bypass** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nothing is blocked, and there are no warnings or prompts. This policy is designed for configurations in which a PowerShell 
script is built into a larger application or for configurations in which PowerShell is used to perform a one-time task that is not 
part of a routine administrative script.

**Undefined** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Removes the currently assigned execution policy from the current scope (current user, local machine, etc.). If the 
execution policy in all scopes is Undefined, the effective execution policy is Restricted, which is the default.

## Ready to go

Once you are happy to go ahead you can set the execution policy for different scopes by specifying the -Scope parameter. The 
available scopes are:

**Process** &nbsp; Affects only the current PowerShell session.

**CurrentUser** &nbsp; Affects only the current user.

**LocalMachine** &nbsp; Affects all users on the computer.

##
In this example the Set_ExecutionPolicy is set as RemoteSigned for the CurrentUser (which was the setting I used to test the 
script):

**Set-ExecutionPolicy RemoteSigned -Scope CurrentUser**
##

## Ready to Run

Once you have everything ready, use the following command to run the script in your Powershell terminal:

.\GhostProbe.ps1 -ip "TARGET_IP_ADDRESS" -startPort CHOSEN_START_PORT -endPort CHOSEN_END_PORT -outputFile "FILE_NAME" -outputFormat "EITHER_txt_OR_xml" -Verbose


##
Be sure to include the " " when inserting the target IP address, the file name and file format. 

The port start and end parameters DO NOT require " ".


<div id="stats">
  <h2>Stats</h2>
  <img src="https://github-readme-stats.vercel.app/api?username=SpartanPhalanx8&theme=vue-dark&show_icons=true&hide_border=true&count_private=true"/>
  <img src="https://github-readme-streak-stats.herokuapp.com/?user=SpartanPhalanx8&theme=vue-dark&hide_border=true"/>
  <img src="https://github-readme-stats.vercel.app/api/top-langs/?username=SpartanPhalanx8&theme=vue-dark&show_icons=true&hide_border=true&layout=compact"/>
</div>

## Favorite Tech
<div>
  <img src="https://github.com/devicons/devicon/blob/master/icons/react/react-original-wordmark.svg" title="React" alt="React" width="40" height="40"/>&nbsp;
  <img src="https://github.com/devicons/devicon/blob/master/icons/salesforce/salesforce-original.svg" title="SF" alt="sf" width="40" height="40"/>&nbsp;
  <img src="https://github.com/devicons/devicon/blob/master/icons/python/python-original-wordmark.svg" title="Python" alt="Py" width="40" height="40"/>&nbsp;
   <img src="https://github.com/devicons/devicon/blob/master/icons/jquery/jquery-plain-wordmark.svg" title="JQuery" alt="JQuery" width="40" height="40"/>&nbsp;
  <img src="https://github.com/devicons/devicon/blob/master/icons/rstudio/rstudio-original.svg" title="R" alt="R" width="40" height="40"/>&nbsp;
  <img src="https://github.com/devicons/devicon/blob/master/icons/d3js/d3js-original.svg"  title="D3" alt="D3" width="40" height="40"/>&nbsp;
<div>
