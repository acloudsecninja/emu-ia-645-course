# Define the path for the log file.
$LogFilePath = "C:\EICAR_Test_logs\virus_emulation.log"

# Create the directory if it doesn't exist
if (!(Test-Path -Path (Split-Path -Path $LogFilePath -Parent))) {
    New-Item -ItemType Directory -Path (Split-Path -Path $LogFilePath -Parent) -Force
}

# Define the function to generate fake virus activity
function Generate-FakeVirusData {
    param(
        [int]$EventCount = 100
    )

    $MalwareNames = @("Trojan.Generic", "Worm.VBS.Doom", "Ransomware.Badlock", "Spyware.Keylogger", "Virus.Win32.Example")
    $AffectedFiles = @("C:\Windows\System32\drivers\etc\hosts", "C:\Users\Public\Downloads\file1.exe", "C:\ProgramData\tempfile.tmp", "C:\Users\Administrator\AppData\Local\malicious.dll")
    $IPAddresses = @("192.168.1.1", "172.16.5.20", "10.0.0.55", "203.0.113.10", "198.51.100.77")
    $Usernames = @("admin", "user1", "guest", "sysadmin", "root")

    for ($i = 1; $i -le $EventCount; $i++) {
        $Timestamp = (Get-Date).AddSeconds(-($i * 10)).ToString("yyyy-MM-dd HH:mm:ss")
        $MalwareName = $MalwareNames | Get-Random
        $AffectedFile = $AffectedFiles | Get-Random
        $IPAddress = $IPAddresses | Get-Random
        $Username = $Usernames | Get-Random
        $Severity = ("Low", "Medium", "High", "Critical") | Get-Random
        $ActionTaken = ("Blocked", "Quarantined", "Allowed", "Failed to Block") | Get-Random

        $LogEntry = "[`$Timestamp`] VirusName=`$MalwareName | File=`$AffectedFile | IP=`$IPAddress | User=`$Username | Severity=`$Severity | Action=`$ActionTaken"
        
        # Write the log entry to the file
        Add-Content -Path $LogFilePath -Value $LogEntry
    }
}

# Generate 200 fake virus events
Write-Host "Generating fake virus data for Splunk ingestion..."
Generate-FakeVirusData -EventCount 200

Write-Host "Fake virus data has been written to $LogFilePath"
