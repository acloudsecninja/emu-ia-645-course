# CAUTION #

## This script will push fake virus emulation data to splunk. 
## This will allow you to see what splunk would see if you had an infection on the system. 

# THIS IS FOR TESTING ONLY.
# Use this script responsibly and only in environments where you have explicit permission. 
# Avoid using it in production or live environments.

# CAUTION #


## How it Works:
1. Log File Generation: It creates a log file at C:\SplunkTestData\virus_emulation.log.
2. Customizable Events: Generates 300 log entries (adjustable via the EventCount parameter).

# Fields for Splunk:
- VirusName: Simulates detected malware names.
- File: Mimics affected file paths.
- IP: Includes fake IP addresses.
- User: Fake usernames tied to the event.
- Severity: Random severity levels (Low to Critical).
- Action: What action was taken (Blocked, Quarantined, etc.).

# Importing Data into Splunk
- Place the log file in a directory monitored by Splunk (e.g., a directory configured as a Splunk input).
- Use appropriate props and transforms in Splunk to parse the log file.

- The username is admin and password is password. Not for Production use.

I was able to use this documentation to recreate this a format that students are able to use and interact with.
    * Main Document - https://splunk.github.io/docker-splunk/
    * Specfic Deployment Type - https://splunk.github.io/docker-splunk/EXAMPLES.html#create-standalone-with-splunk-free-license