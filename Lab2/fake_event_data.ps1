# CAUTION_MITCH_HAS_TOUCHED_THIS_FILE_CAUTION #

# THIS IS FOR TESTING ONLY.
# Use this script responsibly and only in environments where you have explicit permission. 
# Avoid using it in production or live environments.

# CAUTION #

# Define parameters
$LogName = "Application"  # Target Event Log (e.g., Application, System, Security) (Do No not Change)
$SourceName = "FakeEventSource"  # Custom Event Source (Do No not Change)
$EventID = 9999  # Custom Event ID
$EntryType = "Information"  # Entry Type (Information, Warning, Error)
$Message = "This is a fake security event."  # Message content
$NumberOfEvents = 300  # Number of events to generate - This May take a minute or two

# Ensure the Event Source exists
if (-not (Get-EventLog -LogName $LogName -Source $SourceName -ErrorAction SilentlyContinue)) {
    Write-Host "Creating Event Source '$SourceName' in '$LogName' log..."
    New-EventLog -LogName $LogName -Source $SourceName
}

# Generate fake events
Write-Host "Generating $NumberOfEvents fake events in the '$LogName' log with EventID $EventID..."
for ($i = 1; $i -le $NumberOfEvents; $i++) {
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $CustomMessage = "$Message - Event generated at $Timestamp (Count: $i)"
    
    Write-EventLog -LogName $LogName -Source $SourceName -EventID $EventID -EntryType $EntryType -Message $CustomMessage
    Start-Sleep -Milliseconds 500  # Add a slight delay to simulate real-time entries
}

Write-Host "Fake events generated successfully."
