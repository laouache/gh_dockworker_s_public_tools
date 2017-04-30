#!/usr/bin/env bash
#================================================================
# HEADER
#================================================================
#% SYNOPSIS
#+    ${SCRIPT_NAME} [-hv] [-o[file]] args ...
#%
#% DESCRIPTION
#%    initiate a git directory with :
#%    - .gitignore
#%    - LICENSE with GNU v3
#%    - README.md
#%
#% OPTIONS
#%    -o [file], --output=[file]    Set log file (default=/dev/null)
#%                                  use DEFAULT keyword to autoname file
#%                                  The default value is /dev/null.
#%    -t, --timelog                 Add timestamp to log ("+%y/%m/%d@%H:%M:%S")
#%    -x, --ignorelock              Ignore if lock file exists
#%    -h, --help                    Print this help
#%    -v, --version                 Print script information
#%
#% EXAMPLES
#%    ${SCRIPT_NAME} -o DEFAULT arg1 arg2
#%
#================================================================
#- IMPLEMENTATION
#-    version         ${SCRIPT_NAME} 0.0.1
#-    author          dockworker
#-    copyright       Copyright (c) https://gitlab.com/dockworker/s_public_tools/ 
#-    license         GNU General Public License
#-    script_id       516981
#-
#================================================================
#  HISTORY
#     SEE GIT
# 
#================================================================
#  DEBUG OPTION
#    set -n  # Uncomment to check your syntax, without execution.
#    set -x  # Uncomment to debug this shell script
#
#================================================================
# END_OF_HEADER
#================================================================

if [ ! -f $HOME/GIT/dockworker/s_public_tools/app.tools.sh ]; then
  git clone git@gitlab.com:dockworker/s_public_tools.git $HOME/GIT/dockworker/s_public_tools/
fi
source $HOME/GIT/dockworker/s_public_tools/app.header.sh

  #== Check/Set arguments ==#
  [[ $# -gt 2 ]] && error "${SCRIPT_NAME}: Too many arguments" && usage 1>&2 && exit 2

  #== Main part ==#
  #===============#
{ trap 'kill -TERM ${$}; exit 99;' TERM

info "${SCRIPT_NAME}: start $(date "+%y/%m/%d@%H:%M:%S") with process id ${EXEC_ID} by ${USER}@${HOSTNAME}:${PWD}"\
    $( [[ ${flagOptLog} -eq 1 ]] && echo " (LOG: ${fileLog})" || echo " (NOLOG)" );

#================================================================
# START SCRIPT
#================================================================
  #== start your program here ==#

  if [[ ! -d .git ]]; then
      error ".git directory does not exist"
      scriptfinish ;
  fi
  if [[ ! -f ".gitignore" ]] || [[ $flagOptIgnoreLock = 1 ]]; then
      curl https://raw.githubusercontent.com/github/gitignore/master/Global/Windows.gitignore > .gitignore
      curl https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore  >> .gitignore
      curl https://raw.githubusercontent.com/github/gitignore/master/Global/Linux.gitignore  >> .gitignore
      info ".gitignore created"
  else
      info ".gitignore already exists (-x to overwrite)"
  fi
  if [[ ! -f "${SCRIPT_NAME}.md" ]] || [[ $flagOptIgnoreLock = 1 ]]; then
      printf "# ${SCRIPT_NAME} USAGE\n<pre>\n" > "${SCRIPT_NAME}.md"
      usagefull >> "${SCRIPT_NAME}.md"
      printf "\n</pre>\n" >> "${SCRIPT_NAME}.md"
      info "${SCRIPT_NAME}.md created"
  else
      info "${SCRIPT_NAME}.md already exists (-x to overwrite)"
  fi


#sleep 5

  #== end   your program here ==#
#================================================================
# END SCRIPT
#================================================================

scriptfinish ; } 2>&1 | tee ${fileLog}

  #== End ==#
  #=========#
rc_restore
exit $rc

