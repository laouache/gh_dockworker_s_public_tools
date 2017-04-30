# git_initiating.sh USAGE
<pre>
 SYNOPSIS
    git_initiating.sh [-hv] [-o[file]] args ...

 DESCRIPTION
    initiate a git directory with :
    - .gitignore
    - LICENSE with GNU v3
    - README.md

 OPTIONS
    -o [file], --output=[file]    Set log file (default=/dev/null)
                                  use DEFAULT keyword to autoname file
                                  The default value is /dev/null.
    -t, --timelog                 Add timestamp to log ("+%y/%m/%d@%H:%M:%S")
    -x, --ignorelock              Ignore if lock file exists
    -h, --help                    Print this help
    -v, --version                 Print script information

 EXAMPLES
    git_initiating.sh -o DEFAULT arg1 arg2

 IMPLEMENTATION
    version         git_initiating.sh 0.0.1
    author          dockworker
    copyright       Copyright (c) https://gitlab.com/dockworker/s_public_tools/ 
    license         GNU General Public License
    script_id       516981


</pre>
