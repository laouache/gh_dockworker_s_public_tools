This template contains header which is use for usage info as well, useful predefined functions and predefined variables, and manage short and long options.

<h1>Check how this script template works</h1>
Display help with the followins options -h --help --man
and display script information only with -v --version

Use -o or --output options to specify a output log file, otherwise no log file is created.
Log file should contains exactly what you see in terminal output.
<pre>
# Execute with no log
$ ./template.sh "temp*.sh"
# Execute with log file in different folder and prepend timestamp to log
$ ./template.sh -to /tmp/DEFAULT "temp*.sh"
# Check generated logfile
$ cat /tmp/template.1504091701.30799.24503.log
</pre>
Now let s see some error management:
<pre>
# Execute an error in ls command
$ ./template.sh -o DEFAULT "temp*.sh" file1
# Execute with more than two args
$ ./template.sh -o /tmp/test.log "temp*.sh" file2 file3
# Execute with invalid option
$ ./template.sh --invalidopt
# Testing the lock file
$ ./template.sh 2>&1 1>/dev/null & sleep 1 && ./template.sh
</pre>
In the output, you can see notice each line starts with a kind of tag :

- [I] for Information
- [C] for executed Command
- [O] for Output of the executed command
- [E] for Error
- [W] for Warning

This script should catch the following signal:

- INT signal, which is usually sent by CTL+C
- TERM signal, which can be sent with kill -TERM -<script PID>
