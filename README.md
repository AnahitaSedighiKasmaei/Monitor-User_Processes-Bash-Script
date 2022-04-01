# Monitor User Processes By Bash Script


A Bash script named monitor.sh that continuously monitors user processes
and sends you an email whenever any user process has more than 6 descendants.

The body of the email has the following format and  contain the following information:

Time //At which >6 descendants was detected
ProcessID
Desc1PID PPID Level //level=1 indicates child node, Level =2 indicates grandchild etc.
Desc2PID PPID Level //PPID=Parent ID of the descendent process
….
DescnPID PPID Level


The shell script also maintain a log (log.txt) and append it every 5 minutes with
general information on the current user processes running in the shell. Additionally,
whenever the script sends an email, the contents of the email should also be recorded in
the log.
