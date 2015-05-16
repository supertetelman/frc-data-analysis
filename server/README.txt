This is the script setup that was running in real time to calculate useful OPR data during FIRST competition.

There are still some bugs/issues (the setup was created with spotty Internet in a handful of hours) and is dev complete for now.

There was limited Internet during the competition and match data was not uploaded anywhere so we had scouts in the stands updating a shared Google Doc during competition.

This setup was installed on a CentOS server running in the cloud.

These scripts were setup to run every 5 minutes on a cron job and pulled down the Google doc, did some simple parsing of the data into a consumable csv, and fed that csv into our opr algorithm.

The opr algorithm then output the results to a file that was moved to a directory being served by an apache web server.
