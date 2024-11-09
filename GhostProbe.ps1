<#
My Port Scanner with -Verbose option

I am currently working on speeding the scan process by looking to improve
the multi-threading and parallel scanning but its proving a bit more of 
a challenge.

The -outputFile format is currently available in txt and xml but is not 
searchable as yet. That's further work in progress.
#>

param (
    [string]$ip = "127.0.0.1",
    [int]$startPort = 1,
    [int]$endPort = 1024,
    [string]$outputFile = "port_scan_results",
    [string]$outputFormat = "txt",
    [switch]$Verbose
)

# Function to scan a single port
function Test-Port {
    param (
        [string]$ip,
        [int]$port
    )
    try {
        $tcpConnection = [System.Net.Sockets.TcpClient]::new($ip, $port)
        if ($tcpConnection.Connected) {
            if ($Verbose) { Write-Host "Port $port on $ip is open." -ForegroundColor Green }
            $tcpConnection.Close()
            return "open"
        }
    }
    catch {
        if ($Verbose) { Write-Host "Port $port on $ip is closed." -ForegroundColor Red }
    }
    return "closed"
}

# Function to perform a stealthy scan (SYN scan alternative)
function Test-PortStealth {
    param (
        [string]$ip,
        [int]$port
    )
    try {
        $connection = New-Object System.Net.Sockets.TcpClient
        $connection.ConnectAsync($ip, $port).Wait(50)
        if ($connection.Connected) {
            if ($Verbose) { Write-Host "Stealth scan: Port $port on $ip is open." -ForegroundColor Green }
            $connection.Close()
            return "open"
        }
    }
    catch {
        if ($Verbose) { Write-Host "Stealth scan: Port $port on $ip is closed." -ForegroundColor Red }
    }
    return "closed"
}

# Function to get version (simple service banner grabbing)
function Get-Version {
    param (
        [string]$ip,
        [int]$port
    )
    try {
        $tcpConnection = [System.Net.Sockets.TcpClient]::new($ip, $port)
        if ($tcpConnection.Connected) {
            $stream = $tcpConnection.GetStream()
            $buffer = New-Object Byte[] 256
            $stream.ReadTimeout = 1000
            $stream.WriteTimeout = 1000
            $stream.Read($buffer, 0, $buffer.Length)
            $response = [System.Text.Encoding]::ASCII.GetString($buffer).Trim()
            if ($Verbose) { Write-Host "Service version on port ${port}: ${response}" -ForegroundColor Yellow }
            $tcpConnection.Close()
            return $response
        }
    }
    catch {
        if ($Verbose) { Write-Host "Unable to determine service version on port $port." -ForegroundColor Red }
    }
    return "unknown"
}

# Step 3: Perform the scan and gather results using multithreading
$results = @()
$jobs = @()

foreach ($port in $startPort..$endPort) {
    $jobs += Start-Job -ScriptBlock {
        param ($ip, $port, $verbose)
        function Test-Port {
            param (
                [string]$ip,
                [int]$port
            )
            try {
                $tcpConnection = [System.Net.Sockets.TcpClient]::new($ip, $port)
                if ($tcpConnection.Connected) {
                    if ($verbose) { Write-Host "Port $port on $ip is open." -ForegroundColor Green }
                    $tcpConnection.Close()
                    return "open"
                }
            }
            catch {
                if ($verbose) { Write-Host "Port $port on $ip is closed." -ForegroundColor Red }
            }
            return "closed"
        }

        function Test-PortStealth {
            param (
                [string]$ip,
                [int]$port
            )
            try {
                $connection = New-Object System.Net.Sockets.TcpClient
                $connection.ConnectAsync($ip, $port).Wait(50)
                if ($connection.Connected) {
                    if ($verbose) { Write-Host "Stealth scan: Port $port on $ip is open." -ForegroundColor Green }
                    $connection.Close()
                    return "open"
                }
            }
            catch {
                if ($verbose) { Write-Host "Stealth scan: Port $port on $ip is closed." -ForegroundColor Red }
            }
            return "closed"
        }

        function Get-Version {
            param (
                [string]$ip,
                [int]$port
            )
            try {
                $tcpConnection = [System.Net.Sockets.TcpClient]::new($ip, $port)
                if ($tcpConnection.Connected) {
                    $stream = $tcpConnection.GetStream()
                    $buffer = New-Object Byte[] 256
                    $stream.ReadTimeout = 1000
                    $stream.WriteTimeout = 1000
                    $stream.Read($buffer, 0, $buffer.Length)
                    $response = [System.Text.Encoding]::ASCII.GetString($buffer).Trim()
                    if ($verbose) { Write-Host "Service version on port ${port}: ${response}" -ForegroundColor Yellow }
                    $tcpConnection.Close()
                    return $response
                }
            }
            catch {
                if ($verbose) { Write-Host "Unable to determine service version on port $port." -ForegroundColor Red }
            }
            return "unknown"
        }

        $status = Test-Port -ip $ip -port $port
        $stealthStatus = Test-PortStealth -ip $ip -port $port
        $version = Get-Version -ip $ip -port $port
        [PSCustomObject]@{
            Port = $port
            Status = $status
            StealthStatus = $stealthStatus
            Version = $version
        }
    } -ArgumentList $ip, $port, $Verbose
}

# Wait for all jobs to complete and gather results
$jobs | ForEach-Object {
    $job = $_ | Wait-Job | Receive-Job
    $results += $job
    $_ | Remove-Job
}

# Step 4: Output results to file
switch ($outputFormat) {
    "txt" {
        $results | Out-File -FilePath "$outputFile.txt"
    }
    "xml" {
        $results | Export-Clixml -Path "$outputFile.xml"
    }
    default {
        Write-Host "Unsupported output format."
    }
}

# Color the output in console
foreach ($result in $results) {
    if ($result.Status -eq "open") {
        Write-Host "Port $($result.Port) is open." -ForegroundColor Green
    }
}

Write-Output "Port scan completed. Results saved to " -NoNewline
Write-Host "$outputFile.$outputFormat" -ForegroundColor Yellow