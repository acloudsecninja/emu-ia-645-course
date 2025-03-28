# CAUTION #

# THIS IS FOR TESTING ONLY.
- This repo contexts should only be used in a responsible way and only in environments where you have explicit permission as this will replicate a "virus".
- Avoid using it in production or live environments.

1. You will need to run the script on your windows system virus_script.ps1 which will trigger test events from your windows system to send to splunk.

2. You will also need to emulate the test virus eicar and how can you test it on the windows system and trigger a real alert to splunk. You will need to add a test folder under C:\EICAR_Test_logs (this script may do this for you) and add that to the inputs.conf configuration on your windows box. The Config you would add is here and you may run into permission issues which you need to figure out to make work. The inputs code is below. This will monitor this folder so the events will make it to splunk.

```bash
[monitor://C:\EICAR_Test_Logs]
disabled = 0
sourcetype = eicar_logs
index = main
```

3. Once you have this then you can download the eicar test file on your windows system and activate it on your local system so it will generate a "real virus" alert. Turn off your AV on your local windows system before adding it and then once its added then turn it back on and it should give you an alert. https://www.eicar.org/download/eicar-com-2/?wpdmdl=8842&refresh=6778b901837bd1735964929 (This is the URL for the test file and your windows system AV needs to be off - i.e windows defender ,etc. )

4. Refer to the video for the rest of the results and expected outcomes.

- acloudsecninja - Professor Weber
 - Jack Keen Edit